pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__lr-main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__lr-main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E336 : Short_Integer; pragma Import (Ada, E336, "ada__containers_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__io_exceptions_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "ada__numerics_E");
   E344 : Short_Integer; pragma Import (Ada, E344, "ada__strings_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "interfaces__c_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "interfaces__c__strings_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__os_lib_E");
   E399 : Short_Integer; pragma Import (Ada, E399, "system__task_info_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__tags_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__streams_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__file_control_block_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_root_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "ada__finalization_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__file_io_E");
   E364 : Short_Integer; pragma Import (Ada, E364, "ada__streams__stream_io_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "system__storage_pools_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "system__finalization_masters_E");
   E109 : Short_Integer; pragma Import (Ada, E109, "system__storage_pools__subpools_E");
   E372 : Short_Integer; pragma Import (Ada, E372, "ada__calendar_E");
   E370 : Short_Integer; pragma Import (Ada, E370, "ada__calendar__delays_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__text_io_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "system__assertions_E");
   E350 : Short_Integer; pragma Import (Ada, E350, "ada__strings__maps_E");
   E346 : Short_Integer; pragma Import (Ada, E346, "ada__strings__unbounded_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "ada__real_time_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "system__pool_global_E");
   E443 : Short_Integer; pragma Import (Ada, E443, "system__random_seed_E");
   E417 : Short_Integer; pragma Import (Ada, E417, "system__tasking__initialization_E");
   E425 : Short_Integer; pragma Import (Ada, E425, "system__tasking__protected_objects_E");
   E427 : Short_Integer; pragma Import (Ada, E427, "system__tasking__protected_objects__entries_E");
   E431 : Short_Integer; pragma Import (Ada, E431, "system__tasking__queuing_E");
   E437 : Short_Integer; pragma Import (Ada, E437, "system__tasking__stages_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "glib_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "gtkada__types_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "gdk__frame_timings_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "glib__glist_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "gdk__visual_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "glib__gslist_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "gtkada__c_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "glib__object_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "glib__values_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "glib__types_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "glib__type_conversion_hooks_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "gtkada__bindings_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "cairo_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "cairo__region_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "gdk__rectangle_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "glib__generic_properties_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "gdk__color_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "gdk__rgba_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "gdk__event_E");
   E282 : Short_Integer; pragma Import (Ada, E282, "glib__key_file_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "glib__properties_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "glib__string_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "glib__variant_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "glib__g_icon_E");
   E310 : Short_Integer; pragma Import (Ada, E310, "gtk__actionable_E");
   E187 : Short_Integer; pragma Import (Ada, E187, "gtk__builder_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "gtk__buildable_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "gtk__cell_area_context_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "gtk__css_section_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "gtk__enums_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "gtk__orientable_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "gtk__paper_size_E");
   E280 : Short_Integer; pragma Import (Ada, E280, "gtk__page_setup_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "gtk__print_settings_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "gtk__target_entry_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "gtk__target_list_E");
   E380 : Short_Integer; pragma Import (Ada, E380, "lr__synchro_E");
   E382 : Short_Integer; pragma Import (Ada, E382, "lr__synchro__fifo_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "pango__enums_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "pango__attributes_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "pango__font_metrics_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "pango__language_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "pango__font_E");
   E298 : Short_Integer; pragma Import (Ada, E298, "gtk__text_attributes_E");
   E300 : Short_Integer; pragma Import (Ada, E300, "gtk__text_tag_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "pango__font_face_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "pango__font_family_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "pango__fontset_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "pango__matrix_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "pango__context_E");
   E288 : Short_Integer; pragma Import (Ada, E288, "pango__font_map_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "pango__tabs_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "pango__layout_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "gtk__print_context_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "gdk__display_E");
   E290 : Short_Integer; pragma Import (Ada, E290, "gtk__print_operation_preview_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "gtk__tree_model_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "gtk__entry_buffer_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "gtk__editable_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "gtk__cell_editable_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "gtk__adjustment_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "gtk__style_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "gtk__accel_group_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "gdk__frame_clock_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "gdk__pixbuf_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "gtk__icon_source_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "gdk__screen_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "gdk__device_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "gdk__drag_contexts_E");
   E296 : Short_Integer; pragma Import (Ada, E296, "gtk__text_iter_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "gdk__window_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "gtk__selection_data_E");
   E171 : Short_Integer; pragma Import (Ada, E171, "gtk__widget_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "gtk__misc_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "gtk__style_provider_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "gtk__settings_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "gtk__style_context_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "gtk__icon_set_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "gtk__image_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "gtk__cell_renderer_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "gtk__container_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "gtk__bin_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "gtk__box_E");
   E294 : Short_Integer; pragma Import (Ada, E294, "gtk__status_bar_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "gtk__notebook_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "gtk__cell_layout_E");
   E254 : Short_Integer; pragma Import (Ada, E254, "gtk__cell_area_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "gtk__entry_completion_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "gtk__window_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "gtk__dialog_E");
   E278 : Short_Integer; pragma Import (Ada, E278, "gtk__print_operation_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "gtk__gentry_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "gtk__arguments_E");
   E320 : Short_Integer; pragma Import (Ada, E320, "glib__menu_model_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "gtk__action_E");
   E312 : Short_Integer; pragma Import (Ada, E312, "gtk__activatable_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "gtk__button_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "gtk__grange_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "gtk__main_E");
   E330 : Short_Integer; pragma Import (Ada, E330, "gtk__marshallers_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "gtk__menu_item_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "gtk__menu_shell_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "gtk__menu_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "gtk__label_E");
   E332 : Short_Integer; pragma Import (Ada, E332, "gtk__tree_view_column_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "gtkada__handlers_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "gtkada__builder_E");
   E378 : Short_Integer; pragma Import (Ada, E378, "lr__tasks_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "lr__simu_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "lr__affic_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "gtkada__builder__finalize_body");
      begin
         E326 := E326 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gtkada__builder__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gtkada__handlers__finalize_spec");
      begin
         E333 := E333 - 1;
         F3;
      end;
      E332 := E332 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gtk__tree_view_column__finalize_spec");
      begin
         F4;
      end;
      E316 := E316 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gtk__label__finalize_spec");
      begin
         F5;
      end;
      E318 := E318 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gtk__menu__finalize_spec");
      begin
         F6;
      end;
      E324 := E324 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gtk__menu_shell__finalize_spec");
      begin
         F7;
      end;
      E322 := E322 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gtk__menu_item__finalize_spec");
      begin
         F8;
      end;
      E314 := E314 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gtk__grange__finalize_spec");
      begin
         F9;
      end;
      E306 := E306 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gtk__button__finalize_spec");
      begin
         F10;
      end;
      E308 := E308 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gtk__action__finalize_spec");
      begin
         F11;
      end;
      E320 := E320 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "glib__menu_model__finalize_spec");
      begin
         F12;
      end;
      E139 := E139 - 1;
      E177 := E177 - 1;
      E185 := E185 - 1;
      E171 := E171 - 1;
      E191 := E191 - 1;
      E226 := E226 - 1;
      E228 := E228 - 1;
      E156 := E156 - 1;
      E232 := E232 - 1;
      E250 := E250 - 1;
      E260 := E260 - 1;
      E252 := E252 - 1;
      E254 := E254 - 1;
      E262 := E262 - 1;
      E238 := E238 - 1;
      E270 := E270 - 1;
      E276 := E276 - 1;
      E278 := E278 - 1;
      E294 := E294 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gtk__gentry__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gtk__print_operation__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gtk__dialog__finalize_spec");
      begin
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gtk__window__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gtk__entry_completion__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gtk__cell_area__finalize_spec");
      begin
         F18;
      end;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gtk__notebook__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gtk__status_bar__finalize_spec");
      begin
         F20;
      end;
      E222 := E222 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gtk__box__finalize_spec");
      begin
         F21;
      end;
      E236 := E236 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gtk__bin__finalize_spec");
      begin
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gtk__container__finalize_spec");
      begin
         F23;
      end;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gtk__cell_renderer__finalize_spec");
      begin
         F24;
      end;
      E264 := E264 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gtk__image__finalize_spec");
      begin
         F25;
      end;
      E266 := E266 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gtk__icon_set__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gtk__style_context__finalize_spec");
      begin
         F27;
      end;
      E158 := E158 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gtk__settings__finalize_spec");
      begin
         F28;
      end;
      E274 := E274 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gtk__misc__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gtk__widget__finalize_spec");
      begin
         F30;
      end;
      E189 := E189 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "gtk__selection_data__finalize_spec");
      begin
         F31;
      end;
      E136 := E136 - 1;
      E175 := E175 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "gdk__drag_contexts__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "gdk__device__finalize_spec");
      begin
         F33;
      end;
      E160 := E160 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "gdk__screen__finalize_spec");
      begin
         F34;
      end;
      E181 := E181 - 1;
      E268 := E268 - 1;
      declare
         procedure F35;
         pragma Import (Ada, F35, "gtk__icon_source__finalize_spec");
      begin
         F35;
      end;
      declare
         procedure F36;
         pragma Import (Ada, F36, "gdk__pixbuf__finalize_spec");
      begin
         F36;
      end;
      declare
         procedure F37;
         pragma Import (Ada, F37, "gdk__frame_clock__finalize_spec");
      begin
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "gtk__accel_group__finalize_spec");
      begin
         F38;
      end;
      declare
         procedure F39;
         pragma Import (Ada, F39, "gtk__style__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "gtk__adjustment__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "gtk__entry_buffer__finalize_spec");
      begin
         F41;
      end;
      declare
         procedure F42;
         pragma Import (Ada, F42, "gtk__tree_model__finalize_spec");
      begin
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "gdk__display__finalize_spec");
      begin
         F43;
      end;
      E286 := E286 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "gtk__print_context__finalize_spec");
      begin
         F44;
      end;
      E216 := E216 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "pango__layout__finalize_spec");
      begin
         F45;
      end;
      E220 := E220 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "pango__tabs__finalize_spec");
      begin
         F46;
      end;
      E288 := E288 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "pango__font_map__finalize_spec");
      begin
         F47;
      end;
      E198 := E198 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "pango__context__finalize_spec");
      begin
         F48;
      end;
      E212 := E212 - 1;
      declare
         procedure F49;
         pragma Import (Ada, F49, "pango__fontset__finalize_spec");
      begin
         F49;
      end;
      E208 := E208 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "pango__font_family__finalize_spec");
      begin
         F50;
      end;
      E210 := E210 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "pango__font_face__finalize_spec");
      begin
         F51;
      end;
      E300 := E300 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "gtk__text_tag__finalize_spec");
      begin
         F52;
      end;
      E202 := E202 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "pango__font__finalize_spec");
      begin
         F53;
      end;
      E206 := E206 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "pango__language__finalize_spec");
      begin
         F54;
      end;
      E204 := E204 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "pango__font_metrics__finalize_spec");
      begin
         F55;
      end;
      E218 := E218 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "pango__attributes__finalize_spec");
      begin
         F56;
      end;
      E193 := E193 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "gtk__target_list__finalize_spec");
      begin
         F57;
      end;
      E292 := E292 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "gtk__print_settings__finalize_spec");
      begin
         F58;
      end;
      E280 := E280 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "gtk__page_setup__finalize_spec");
      begin
         F59;
      end;
      E284 := E284 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "gtk__paper_size__finalize_spec");
      begin
         F60;
      end;
      E272 := E272 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "gtk__css_section__finalize_spec");
      begin
         F61;
      end;
      E256 := E256 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "gtk__cell_area_context__finalize_spec");
      begin
         F62;
      end;
      E187 := E187 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "gtk__builder__finalize_spec");
      begin
         F63;
      end;
      E242 := E242 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "glib__variant__finalize_spec");
      begin
         F64;
      end;
      E105 := E105 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "glib__object__finalize_spec");
      begin
         F65;
      end;
      E179 := E179 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "gdk__frame_timings__finalize_spec");
      begin
         F66;
      end;
      E085 := E085 - 1;
      declare
         procedure F67;
         pragma Import (Ada, F67, "glib__finalize_spec");
      begin
         F67;
      end;
      E427 := E427 - 1;
      declare
         procedure F68;
         pragma Import (Ada, F68, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F68;
      end;
      E097 := E097 - 1;
      declare
         procedure F69;
         pragma Import (Ada, F69, "system__pool_global__finalize_spec");
      begin
         F69;
      end;
      E346 := E346 - 1;
      declare
         procedure F70;
         pragma Import (Ada, F70, "ada__strings__unbounded__finalize_spec");
      begin
         F70;
      end;
      E064 := E064 - 1;
      declare
         procedure F71;
         pragma Import (Ada, F71, "ada__text_io__finalize_spec");
      begin
         F71;
      end;
      E109 := E109 - 1;
      declare
         procedure F72;
         pragma Import (Ada, F72, "system__storage_pools__subpools__finalize_spec");
      begin
         F72;
      end;
      E089 := E089 - 1;
      declare
         procedure F73;
         pragma Import (Ada, F73, "system__finalization_masters__finalize_spec");
      begin
         F73;
      end;
      E364 := E364 - 1;
      declare
         procedure F74;
         pragma Import (Ada, F74, "ada__streams__stream_io__finalize_spec");
      begin
         F74;
      end;
      declare
         procedure F75;
         pragma Import (Ada, F75, "system__file_io__finalize_body");
      begin
         E072 := E072 - 1;
         F75;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, True, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, True, False, True, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           False, True, True, True, True, False, True, False, 
           False, False, True, False, False, True, False, True, 
           False, False, True, False, True, False, True, True, 
           False, True, True, False, True, True, False, False, 
           False, False, True, True, True, True, True, False, 
           False, True, False, True, True, True, False, True, 
           True, False, True, True, True, True, False, False, 
           True, False, False, False, False, True, True, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 3, 4, 2, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      Ada.Containers'Elab_Spec;
      E336 := E336 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E067 := E067 + 1;
      Ada.Numerics'Elab_Spec;
      E304 := E304 + 1;
      Ada.Strings'Elab_Spec;
      E344 := E344 + 1;
      Interfaces.C'Elab_Spec;
      E077 := E077 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E087 := E087 + 1;
      System.Os_Lib'Elab_Body;
      E079 := E079 + 1;
      System.Task_Info'Elab_Spec;
      E399 := E399 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E051 := E051 + 1;
      Ada.Streams'Elab_Spec;
      E066 := E066 + 1;
      System.File_Control_Block'Elab_Spec;
      E082 := E082 + 1;
      System.Finalization_Root'Elab_Spec;
      E075 := E075 + 1;
      Ada.Finalization'Elab_Spec;
      E073 := E073 + 1;
      System.File_Io'Elab_Body;
      E072 := E072 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E364 := E364 + 1;
      System.Storage_Pools'Elab_Spec;
      E095 := E095 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E089 := E089 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E109 := E109 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E372 := E372 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E370 := E370 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E064 := E064 + 1;
      System.Assertions'Elab_Spec;
      E128 := E128 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E350 := E350 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E346 := E346 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E384 := E384 + 1;
      System.Pool_Global'Elab_Spec;
      E097 := E097 + 1;
      System.Random_Seed'Elab_Body;
      E443 := E443 + 1;
      System.Tasking.Initialization'Elab_Body;
      E417 := E417 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E425 := E425 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E427 := E427 + 1;
      System.Tasking.Queuing'Elab_Body;
      E431 := E431 + 1;
      System.Tasking.Stages'Elab_Body;
      E437 := E437 + 1;
      Glib'Elab_Spec;
      E085 := E085 + 1;
      Gtkada.Types'Elab_Spec;
      E126 := E126 + 1;
      Gdk.Frame_Timings'Elab_Spec;
      E179 := E179 + 1;
      E130 := E130 + 1;
      Gdk.Visual'Elab_Body;
      E162 := E162 + 1;
      E132 := E132 + 1;
      E124 := E124 + 1;
      Glib.Object'Elab_Spec;
      Glib.Values'Elab_Body;
      E122 := E122 + 1;
      E107 := E107 + 1;
      E120 := E120 + 1;
      E114 := E114 + 1;
      E105 := E105 + 1;
      Cairo'Elab_Spec;
      E143 := E143 + 1;
      E145 := E145 + 1;
      E149 := E149 + 1;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E152 := E152 + 1;
      Gdk.Color'Elab_Spec;
      E173 := E173 + 1;
      E154 := E154 + 1;
      E147 := E147 + 1;
      E282 := E282 + 1;
      E164 := E164 + 1;
      E244 := E244 + 1;
      Glib.Variant'Elab_Spec;
      E242 := E242 + 1;
      E240 := E240 + 1;
      Gtk.Actionable'Elab_Spec;
      E310 := E310 + 1;
      Gtk.Builder'Elab_Spec;
      Gtk.Builder'Elab_Body;
      E187 := E187 + 1;
      E224 := E224 + 1;
      Gtk.Cell_Area_Context'Elab_Spec;
      Gtk.Cell_Area_Context'Elab_Body;
      E256 := E256 + 1;
      Gtk.Css_Section'Elab_Spec;
      E272 := E272 + 1;
      E167 := E167 + 1;
      Gtk.Orientable'Elab_Spec;
      E230 := E230 + 1;
      Gtk.Paper_Size'Elab_Spec;
      E284 := E284 + 1;
      Gtk.Page_Setup'Elab_Spec;
      Gtk.Page_Setup'Elab_Body;
      E280 := E280 + 1;
      Gtk.Print_Settings'Elab_Spec;
      Gtk.Print_Settings'Elab_Body;
      E292 := E292 + 1;
      E195 := E195 + 1;
      Gtk.Target_List'Elab_Spec;
      E193 := E193 + 1;
      E380 := E380 + 1;
      LR.SYNCHRO.FIFO'ELAB_BODY;
      E382 := E382 + 1;
      E200 := E200 + 1;
      Pango.Attributes'Elab_Spec;
      E218 := E218 + 1;
      Pango.Font_Metrics'Elab_Spec;
      E204 := E204 + 1;
      Pango.Language'Elab_Spec;
      E206 := E206 + 1;
      Pango.Font'Elab_Spec;
      Pango.Font'Elab_Body;
      E202 := E202 + 1;
      E298 := E298 + 1;
      Gtk.Text_Tag'Elab_Spec;
      Gtk.Text_Tag'Elab_Body;
      E300 := E300 + 1;
      Pango.Font_Face'Elab_Spec;
      Pango.Font_Face'Elab_Body;
      E210 := E210 + 1;
      Pango.Font_Family'Elab_Spec;
      Pango.Font_Family'Elab_Body;
      E208 := E208 + 1;
      Pango.Fontset'Elab_Spec;
      Pango.Fontset'Elab_Body;
      E212 := E212 + 1;
      E214 := E214 + 1;
      Pango.Context'Elab_Spec;
      Pango.Context'Elab_Body;
      E198 := E198 + 1;
      Pango.Font_Map'Elab_Spec;
      Pango.Font_Map'Elab_Body;
      E288 := E288 + 1;
      Pango.Tabs'Elab_Spec;
      E220 := E220 + 1;
      Pango.Layout'Elab_Spec;
      Pango.Layout'Elab_Body;
      E216 := E216 + 1;
      Gtk.Print_Context'Elab_Spec;
      Gtk.Print_Context'Elab_Body;
      E286 := E286 + 1;
      Gdk.Display'Elab_Spec;
      Gtk.Tree_Model'Elab_Spec;
      Gtk.Entry_Buffer'Elab_Spec;
      Gtk.Cell_Editable'Elab_Spec;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Style'Elab_Spec;
      Gtk.Accel_Group'Elab_Spec;
      Gdk.Frame_Clock'Elab_Spec;
      Gdk.Pixbuf'Elab_Spec;
      Gtk.Icon_Source'Elab_Spec;
      E268 := E268 + 1;
      E181 := E181 + 1;
      Gdk.Screen'Elab_Spec;
      Gdk.Screen'Elab_Body;
      E160 := E160 + 1;
      Gdk.Device'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Body;
      E175 := E175 + 1;
      Gdk.Device'Elab_Body;
      E136 := E136 + 1;
      E296 := E296 + 1;
      Gdk.Window'Elab_Spec;
      E234 := E234 + 1;
      Gtk.Selection_Data'Elab_Spec;
      E189 := E189 + 1;
      Gtk.Widget'Elab_Spec;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E274 := E274 + 1;
      E169 := E169 + 1;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E158 := E158 + 1;
      Gtk.Style_Context'Elab_Spec;
      Gtk.Icon_Set'Elab_Spec;
      E266 := E266 + 1;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E264 := E264 + 1;
      Gtk.Cell_Renderer'Elab_Spec;
      Gtk.Container'Elab_Spec;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E236 := E236 + 1;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E222 := E222 + 1;
      Gtk.Status_Bar'Elab_Spec;
      Gtk.Notebook'Elab_Spec;
      E258 := E258 + 1;
      Gtk.Cell_Area'Elab_Spec;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Window'Elab_Spec;
      Gtk.Dialog'Elab_Spec;
      Gtk.Print_Operation'Elab_Spec;
      Gtk.Gentry'Elab_Spec;
      Gtk.Status_Bar'Elab_Body;
      E294 := E294 + 1;
      E290 := E290 + 1;
      Gtk.Print_Operation'Elab_Body;
      E278 := E278 + 1;
      Gtk.Notebook'Elab_Body;
      E276 := E276 + 1;
      Gtk.Style_Context'Elab_Body;
      E270 := E270 + 1;
      Gtk.Gentry'Elab_Body;
      E238 := E238 + 1;
      E262 := E262 + 1;
      Gtk.Cell_Area'Elab_Body;
      E254 := E254 + 1;
      Gtk.Entry_Completion'Elab_Body;
      E252 := E252 + 1;
      Gtk.Cell_Renderer'Elab_Body;
      E260 := E260 + 1;
      Gtk.Entry_Buffer'Elab_Body;
      E250 := E250 + 1;
      E248 := E248 + 1;
      E246 := E246 + 1;
      Gtk.Window'Elab_Body;
      E232 := E232 + 1;
      Gtk.Dialog'Elab_Body;
      E156 := E156 + 1;
      Gtk.Adjustment'Elab_Body;
      E228 := E228 + 1;
      Gtk.Container'Elab_Body;
      E226 := E226 + 1;
      Gtk.Style'Elab_Body;
      E191 := E191 + 1;
      Gtk.Widget'Elab_Body;
      E171 := E171 + 1;
      Gtk.Accel_Group'Elab_Body;
      E185 := E185 + 1;
      Gdk.Frame_Clock'Elab_Body;
      E177 := E177 + 1;
      E141 := E141 + 1;
      Gdk.Display'Elab_Body;
      E139 := E139 + 1;
      Glib.Menu_Model'Elab_Spec;
      Glib.Menu_Model'Elab_Body;
      E320 := E320 + 1;
      Gtk.Action'Elab_Spec;
      Gtk.Action'Elab_Body;
      E308 := E308 + 1;
      Gtk.Activatable'Elab_Spec;
      E312 := E312 + 1;
      Gtk.Button'Elab_Spec;
      Gtk.Button'Elab_Body;
      E306 := E306 + 1;
      Gtk.Grange'Elab_Spec;
      Gtk.Grange'Elab_Body;
      E314 := E314 + 1;
      E134 := E134 + 1;
      E330 := E330 + 1;
      Gtk.Menu_Item'Elab_Spec;
      Gtk.Menu_Item'Elab_Body;
      E322 := E322 + 1;
      Gtk.Menu_Shell'Elab_Spec;
      Gtk.Menu_Shell'Elab_Body;
      E324 := E324 + 1;
      Gtk.Menu'Elab_Spec;
      Gtk.Menu'Elab_Body;
      E318 := E318 + 1;
      Gtk.Label'Elab_Spec;
      Gtk.Label'Elab_Body;
      E316 := E316 + 1;
      Gtk.Tree_View_Column'Elab_Spec;
      Gtk.Tree_View_Column'Elab_Body;
      E332 := E332 + 1;
      Gtkada.Handlers'Elab_Spec;
      E333 := E333 + 1;
      Gtkada.Builder'Elab_Spec;
      Gtkada.Builder'Elab_Body;
      E326 := E326 + 1;
      LR.TASKS'ELAB_SPEC;
      LR.SIMU'ELAB_BODY;
      E368 := E368 + 1;
      LR.TASKS'ELAB_BODY;
      E378 := E378 + 1;
      LR.AFFIC'ELAB_BODY;
      E303 := E303 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_lr__main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-synchro.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-synchro-fifo.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-simu.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-tasks.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-affic.o
   --   /home/hmoudden/Bureau/TP-Ada-LR/lr-main.o
   --   -L/home/hmoudden/Bureau/TP-Ada-LR/
   --   -L/home/hmoudden/Bureau/TP-Ada-LR/
   --   -L/usr/lib/x86_64-linux-gnu/ada/adalib/gtkada/
   --   -L/usr/lib/gcc/x86_64-linux-gnu/7/adalib/
   --   -shared
   --   -shared-libgcc
   --   -shared-libgcc
   --   -lgthread-2.0
   --   -shared-libgcc
   --   -lgnarl-7
   --   -lgnat-7
   --   -lpthread
   --   -lrt
--  END Object file/option list   

end ada_main;
