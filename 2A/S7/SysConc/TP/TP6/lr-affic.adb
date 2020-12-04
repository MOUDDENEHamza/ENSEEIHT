-- Time-stamp: <09 nov 2019 09:54 queinnec@enseeiht.fr>

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Tags;
with Ada.Numerics.Discrete_Random;
with Glib; use Glib;
with Gtkada.Builder;
with Gtkada.Handlers;
with Gdk.Threads;
with Glib.Error;
with Gtk.Widget; use Gtk.Widget;
with Gtk.Label;
with Gtk.GRange;
with Gtk.Button;
with Cairo;
with LR.Tasks; use LR.Tasks; -- just for Proc_Id
with LR.Simu;

package body LR.Affic is

   Nb_Lecteurs : Natural;
   Nb_Redacteurs : Natural;

   Dialog_Aide : Gtk.Widget.Gtk_Widget;
   Bouton_Pause : Gtk.Button.Gtk_Button;
   Drawing_Areas : Gtk.Widget.Gtk_Widget;

   type Point is record
      X : Natural;
      Y : Natural;
   end record;

   type Objet is record
      Etat : Proc_Etat;
      Pos_Rien : Point;
      Pos_Demande : Point;
      Pos_Utilise : Point;
   end record;

   type Les_Objets_Array is array(Positive range <>) of Objet;
   Les_Redacteurs : access Les_Objets_Array;
   Les_Lecteurs : access Les_Objets_Array;

   -- Event "clicked" on button "aide"
   procedure Aide_Afficher(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) is
   begin
      Dialog_Aide.Show;
   end Aide_Afficher;

   -- Event "clicked" on button "fermer"
   procedure Aide_Fermer(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) is
   begin
      Dialog_Aide.Hide;
   end Aide_Fermer;

   -- Event clicked on button "pause".
   procedure Pause_Or_Run(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) is
   begin
      LR.Simu.Swap_Running;
      if LR.Simu.Get_Running then
         Bouton_Pause.Set_Label("Pause");
      else
         Bouton_Pause.Set_Label("Run");
      end if;
   end Pause_Or_Run;

   -- Event "clicked" on button "paramètres"
   --  procedure Show_Param(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) is
   --  begin
   --     -- Gtk.Widget.Show(Dialog_Parametres);
   --     null;
   --  end Show_Param;

   -- Event "value_changed" de l'ajustement de l'échelle de vitesse du temps.
   procedure Set_Timespeed(Scale : access Gtk_Widget_Record'Class) is
      Val : Natural;
      Self : Gtk.GRange.Gtk_Range := Gtk.GRange.Gtk_Range(Scale);
   begin
      Val := Natural(Self.Get_Adjustment.Get_Value);
      LR.Simu.Set_Timespeed(Val);
   end Set_Timespeed;

   procedure Quitter(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) is
      procedure Libc_Exit(Status: Natural);
      pragma Import(C, Libc_Exit, "exit");
   begin
      Libc_Exit(0);
   end Quitter;

   ----------------------------------------------------------------

   package Random_Proc is
      function Get(Min, Max: Proc_Id) return Proc_Id;
   end Random_Proc;
   package body Random_Proc is
      package Rand_Proc is new Ada.Numerics.Discrete_Random(Proc_Id);
      Generator : Rand_Proc.Generator;
      function Get(Min, Max: Proc_Id) return Proc_Id Is
         X : Proc_Id;
      begin
         loop
            X := Rand_Proc.Random(Generator);
            exit when (X >= Min and X <= Max);
         end loop;
         return X;
      end Get;
   begin
      Rand_Proc.Reset(Generator);
   end Random_Proc;

   -- Cherche dans le tableau un processus dans l'état.
   -- S'il y en a au moins un, un processus *au hasard* (dans cet état) est réveillé.
   function Chercher_Dormeur (Tab: access Les_Objets_Array; Etat: Proc_Etat) return Boolean is
      Base : Proc_Id;
   begin
      -- Tirons au hasard le point de départ, puis on parcourt circulairement.
      Base := Random_Proc.Get(Tab'First, Tab'Last);
      for i in Base .. Tab'Last loop
         if Tab(i).Etat = Etat then
            LR.Simu.wakeup (i);
            return True;
         end if;
      end loop;
      for i in Tab'First..Base-1 loop
         if Tab(i).Etat = Etat then
            LR.Simu.wakeup (i);
            return True;
         end if;
      end loop;
      return False;
   end Chercher_Dormeur;

     function Click_Event_Red(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) return Boolean is
     begin
        return Chercher_Dormeur(Les_Redacteurs, Redacteur_Rien);
     end Click_Event_Red;

     function Click_Event_Lect(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) return Boolean is
     begin
        return Chercher_Dormeur(Les_Lecteurs, Lecteur_Rien);
     end Click_Event_Lect;

     function Click_Event_Inside(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) return Boolean is
     begin
        return
          Chercher_Dormeur(Les_Lecteurs, Lecteur_Lit)
          or else Chercher_Dormeur(Les_Redacteurs, Redacteur_Ecrit);
     end Click_Event_Inside;

     ----------------------------------------------------------------

     -- Event configure (= realize or resize) on window redacteur.
     -- XXXX Hypothèses:
     --   - les trois fenêtres rédacteur, inside et lecteur ont la même hauteur;
     --   - la fenêtre inside est deux fois moins large que la fenêtre rédacteur;
     --   - la fenêtre rédacteur est en haut, la fenêtre lecteur en bas.
     function Compute_Placement(Builder: access Gtkada.Builder.Gtkada_Builder_Record'class) return Boolean is
        
        Taille_Fen_Dem_X, Taille_Fen_Inside_X : Float;
        Taille_Fen_Dem_Y, Taille_Fen_Inside_Y : Float;
        Interv_Rien, Interv_Demande, Interv_Utilise : Float;
        Start_Rien, Start_Demande, Start_Utilise : Float;
        Allocation : Gtk.Widget.Gtk_Allocation;
     begin
        Put_Line("Event configure");
        Gtk.Widget.Get_Allocation(Gtk_Widget(Gtkada.Builder.Get_Object(Builder, "drawingarea_redacteur")), Allocation);
        Taille_Fen_Dem_X := Float(Allocation.Width);
        Taille_Fen_Dem_Y := Float(Allocation.Height);

        Taille_Fen_Inside_X := Taille_Fen_Dem_X / 2.0;
        Taille_Fen_Inside_Y := Taille_Fen_Dem_Y;

        Interv_Rien := Taille_Fen_Dem_X / (Float(Nb_Lecteurs - 1) + 4.0);
        Interv_Utilise := Taille_Fen_Inside_X / (Float(Nb_Lecteurs - 1) + 4.0);
        Interv_Demande := Interv_Utilise;
        Start_Rien := 2.0 * Interv_Rien;
        Start_Utilise := 2.0 * Interv_Utilise;
        Start_Demande := (taille_fen_dem_x - taille_fen_inside_x) / 2.0 + Start_Utilise;

        for i in Les_Lecteurs'range loop
           Les_Lecteurs(i).Pos_Rien.x := Natural(Start_Rien);
           Les_Lecteurs(i).Pos_Rien.y := Natural(Taille_Fen_Dem_Y * 0.75);
           Les_Lecteurs(i).Pos_Demande.x := Natural(Start_Demande);
           Les_Lecteurs(i).Pos_Demande.y := Natural(Taille_Fen_Dem_Y * 0.25);
           Les_Lecteurs(i).Pos_Utilise.x := Natural(Start_Utilise);
           Les_Lecteurs(i).Pos_Utilise.y := Natural(Taille_Fen_Inside_Y * 0.75);
           Start_Rien := Start_Rien + Interv_Rien;
           Start_Demande := Start_Demande + Interv_Demande;
           Start_Utilise := Start_Utilise + Interv_Utilise;
        end loop;

        -- Les rédacteurs
        Interv_Rien := Taille_Fen_Dem_X / (Float(Nb_Redacteurs - 1) + 4.0);
        Interv_Utilise := Taille_Fen_Inside_X / (Float(Nb_Redacteurs - 1) + 4.0);
        Interv_Demande := Interv_Utilise;
        Start_Rien := 2.0 * Interv_Rien;
        Start_Utilise := 2.0 * Interv_Utilise;
        Start_Demande := (taille_fen_dem_x - taille_fen_inside_x) / 2.0 + Start_Utilise;

        for i in Les_Redacteurs'range loop
           Les_Redacteurs(i).Pos_Rien.x := Natural(Start_Rien);
           Les_Redacteurs(i).Pos_Rien.y := Natural(Taille_Fen_Dem_Y * 0.25);
           Les_Redacteurs(i).Pos_Demande.x := Natural(Start_Demande);
           Les_Redacteurs(i).Pos_Demande.y := Natural(Taille_Fen_Dem_Y * 0.90);
           Les_Redacteurs(i).Pos_Utilise.x := Natural(Start_Utilise);
           Les_Redacteurs(i).Pos_Utilise.y := Natural(Taille_Fen_Inside_Y * 0.25);
           Start_Rien := Start_Rien + Interv_Rien;
           Start_Demande := Start_Demande + Interv_Demande;
           Start_Utilise := Start_Utilise + Interv_Utilise;
        end loop;

        return False;
     end Compute_Placement;

     ----------------------------------------------------------------
     
     procedure Tracer_Cercle(Context: Cairo.Cairo_Context; Fill : Boolean; Center: Point) is
        Rayon : constant Natural := 5;     
     begin
        Cairo.Set_Line_Width(Context, 2.0);
        Cairo.Set_Source_RGB(Context, 0.0, 0.0 ,0.0);
        Cairo.Arc(Context, Gdouble(Center.X - Rayon), Gdouble(Center.Y - Rayon), Gdouble(Rayon*2), 0.0, 2.0 * 3.14159);
        if Fill then Cairo.Fill(Context); else Cairo.Stroke(Context); end if;
     end Tracer_Cercle;

     function Draw_Callback_Red(Widget : access Gtk_Widget_Record'Class; Context: Cairo.Cairo_Context) return Boolean is
     begin
        for I in Les_Redacteurs'range loop
           case Les_Redacteurs(I).Etat is
              when Redacteur_Demande =>
                 Tracer_Cercle(Context, True, Les_Redacteurs(i).Pos_Demande);
              when Redacteur_Rien =>
                 Tracer_Cercle(Context, True, Les_Redacteurs(i).Pos_Rien);
              when others => null;
           end case;
        end loop;
        return True;
     end Draw_Callback_Red;
     
     function Draw_Callback_Lec(Widget : access Gtk_Widget_Record'Class; Context: Cairo.Cairo_Context) return Boolean is
     begin
        for I in Les_Lecteurs'range loop
           case Les_Lecteurs(I).Etat is
              when Lecteur_Demande =>
                 Tracer_Cercle(Context, False, Les_Lecteurs(i).Pos_Demande);
              when Lecteur_Rien =>
                 Tracer_Cercle(Context, False, Les_Lecteurs(i).Pos_Rien);
              when others => null;
           end case;
        end loop;
        return True;
     end Draw_Callback_Lec;
     
     function Draw_Callback_Inside(Widget : access Gtk_Widget_Record'Class; Context: Cairo.Cairo_Context) return Boolean is
     begin
        for I in Les_Lecteurs'range loop
           case Les_Lecteurs(I).Etat is
              when Lecteur_Lit =>
                 Tracer_Cercle(Context, False, Les_Lecteurs(i).Pos_Utilise);
              when others => null;
           end case;
        end loop;
        for I in Les_Redacteurs'range loop
           case Les_Redacteurs(I).Etat is
              when Redacteur_Ecrit =>
                 Tracer_Cercle(Context, True, Les_Redacteurs(i).Pos_Utilise);
              when others => null;
           end case;
        end loop;
        return True;
     end Draw_Callback_Inside;
     
     ----------------------------------------------------------------

     procedure Init (Nomstrategie: String; Nblect : Natural; Nbred: Natural) is
        Builder : Gtkada.Builder.Gtkada_Builder;
     begin
        Nb_Lecteurs := NbLect;
        Nb_Redacteurs := NbRed;
        -- XXXX les id doivent être compatibles avec LR.Main.Start_Client_Tasks
        Les_Lecteurs := new Les_Objets_Array(1 .. Nb_Lecteurs);
        Les_Redacteurs := new Les_Objets_Array(Nb_Lecteurs+1 .. Nb_Lecteurs + Nb_Redacteurs);
        for I in Les_Lecteurs'range loop
           Les_Lecteurs(I).Etat := Lecteur_Rien;
        end loop;
        for I in Les_Redacteurs'range loop
           Les_Redacteurs(I).Etat := Redacteur_Rien;
        end loop;

        Gtkada.Builder.Gtk_New (Builder);
        declare
           Error   : aliased Glib.Error.GError;
           Useless : GUint;
        begin
           Useless := Builder.Add_From_File("lectred.glade", Error'Access);
        end;
        Dialog_Aide := Gtk_Widget(Builder.Get_Object("dialog_aide"));
        Bouton_Pause := Gtk.Button.Gtk_Button(Builder.Get_Object("bouton_pause"));
        Drawing_Areas := Gtk_Widget(Builder.Get_Object("drawingarea_all"));

        declare
           Nom_Strategie : Gtk.Label.Gtk_Label :=  Gtk.Label.Gtk_Label(Builder.Get_Object("label_strategie"));
        begin
           Nom_Strategie.Set_Text(Nomstrategie);
        end;

        declare
           Timespeed_Scale : Gtk.GRange.Gtk_Range := Gtk.GRange.Gtk_Range(Builder.Get_Object("timespeed"));
        begin
           Gtkada.Handlers.Widget_Callback.Connect(Timespeed_Scale, "value-changed", Set_Timespeed'Access);
           Set_Timespeed(Timespeed_Scale);
        end;

        Builder.Register_Handler ("aff_aide_afficher", Aide_Afficher'Access);
        Builder.Register_Handler ("aff_aide_fermer", Aide_Fermer'Access);
        Builder.Register_Handler ("aff_click_event_red", Click_Event_Red'Access);
        Builder.Register_Handler ("aff_click_event_lect", Click_Event_Lect'Access);
        Builder.Register_Handler ("aff_click_event_inside", Click_Event_Inside'Access);
        Builder.Register_Handler ("aff_compute_placement", Compute_Placement'Access);
        -- Builder.Register_Handler ("aff_expose", Expose'Access);
        Builder.Register_Handler ("aff_pause_or_run", Pause_Or_Run'Access);
        -- Builder.Register_Handler ("aff_show_param", Show_Param'Access);
        Builder.Register_Handler ("aff_quitter", Quitter'Access);
        Builder.Do_Connect;
        
        declare
           Xfen_Redacteur : Gtk_Widget := Gtk_Widget(Builder.Get_Object("drawingarea_redacteur"));
           Xfen_Lecteur : Gtk_Widget := Gtk_Widget(Builder.Get_Object("drawingarea_lecteur"));
           Xfen_Inside : Gtk_Widget := Gtk_Widget(Builder.Get_Object("drawingarea_inside"));
        begin
           Xfen_Redacteur.On_Draw(Draw_Callback_Red'Access);
           Xfen_Lecteur.On_Draw(Draw_Callback_Lec'Access);
           Xfen_Inside.On_Draw(Draw_Callback_Inside'Access);
        end;
        
        Gtk.Widget.Show_All(Gtk_Widget(Builder.Get_Object("LectRed")));
     end Init;

     procedure Changer_Etat(Id: Proc_Id; Etat: Proc_Etat) is
     begin
        Gdk.Threads.Enter;
        -- Put_Line(Natural'Image(Id) & " -> " & Proc_Etat'Image(Etat));
        if Id in Les_Lecteurs'Range then
           Les_Lecteurs(Id).Etat := Etat;
        else 
           Les_Redacteurs(Id).Etat := Etat;
        end if;
        Drawing_Areas.Queue_Draw;
        Gdk.Threads.Leave;
     end Changer_Etat;

   end LR.Affic;
