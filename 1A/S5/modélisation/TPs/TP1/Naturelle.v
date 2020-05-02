Require Export Classical.

Ltac Hyp Nom := exact Nom.

Ltac I_imp' :=
  match goal with
  | |- ?A -> ?B => let hyp := fresh "H" in intro hyp
  | _           => fail
  end.

Ltac I_imp Nom :=
  match goal with
  | |- ?A -> ?B => intro Nom
  | _           => fail
  end.

Theorem E_imp_th : forall (phi psi : Prop), (phi -> psi) -> phi -> psi.
intros Pphi Ppsi Hphi2psi.
Hyp Hphi2psi.
Qed.

Ltac E_imp' :=
  match goal with
  | |- ?P => eapply (E_imp_th _ P)
  end.

Ltac E_imp phi :=
  match goal with
  | |- ?P => apply (E_imp_th phi P)
  end.

Ltac I_forall' :=
  match goal with
  | |- forall (x : ?A), ?P => let hyp := fresh x in intro hyp
  | _                      => fail
  end.

Ltac I_forall Nom :=
  match goal with
  | |- forall (x : ?A), ?P => intro Nom
  | _                      => fail
  end.

Theorem E_forall_th : forall (A : Type) (phi : A -> Prop) a, (forall x, phi x) -> phi a.
Proof.
firstorder.
Qed.

Ltac E_forall x :=
  pattern x;
  match goal with
  | |- (?P x) => apply (E_forall_th _ P x)
  | _         => fail
  end.

Ltac I_et :=
  match goal with
  | |- (?A /\ ?B) => apply (@conj A B)
  | _             => fail
  end.

Theorem E_et_g_th : forall (phi psi : Prop), (phi /\ psi) -> phi.
intros Pphi Ppsi Hphi_et_psi.
elim Hphi_et_psi.
intros Hphi Hpsi.
Hyp Hphi.
Qed.

Ltac E_et_g' :=
  match goal with
  | |- ?P => eapply (E_et_g_th P _)
  end.

Ltac E_et_g psi :=
  match goal with
  | |- ?P => apply (E_et_g_th P psi)
  end.

Theorem E_et_d_th : forall (phi psi : Prop), (phi /\ psi) -> psi.
intros Pphi Ppsi H_phi_et_psi.
elim H_phi_et_psi.
intros Hphi Hpsi.
Hyp Hpsi.
Qed.

Ltac E_et_d' :=
  match goal with
  | |- ?P => eapply (E_et_d_th _ P)
  end.

Ltac E_et_d phi :=
  match goal with
  | |- ?P => eapply (E_et_d_th phi P)
  end.

Theorem E_ou_th : forall (phi psi chi : Prop), (phi \/ psi) -> (phi -> chi) -> (psi -> chi) -> chi.
intros Pphi Ppsi Pchi Hphi_ou_psi Hphi_imp_chi Hpsi_imp_chi.
elim Hphi_ou_psi.
Hyp Hphi_imp_chi.
Hyp Hpsi_imp_chi.
Qed.

Ltac E_ou' :=
  match goal with
  | |- ?P => eapply (E_ou_th _ _ P)
  end.

Ltac E_ou phi psi :=
  match goal with
  | |- ?P => apply (E_ou_th phi psi P)
  end.

Ltac I_ou_g :=
  match goal with
  | |- (?A \/ ?B) => apply (@or_introl A B)
  | _             => fail
  end.

Ltac I_ou_d :=
  match goal with
  | |- (?A \/ ?B) => apply (@or_intror A B)
  | _             => fail
  end.

Ltac I_exists' :=
  match goal with
  | |- exists (x : ?A), (@?P x) => eapply (@ex_intro A P _)
  | _                           => fail
  end.

Ltac I_exists t :=
  match goal with
  | |- exists (x : ?A), (@?P x) => apply (@ex_intro _ P t)
  | _                           => fail
  end.

Theorem E_exists_th : forall (A : Type) (phi : A -> Prop) (chi : Prop), (exists x, phi x) -> (forall a, phi a -> chi) -> chi.
Proof.
firstorder.
Qed.
(*
Ltac E_exists phi :=
  match goal with
  | |- ?P => apply (E_exists_th _ phi P)
  end.
*)
Ltac E_exists phi :=
  match goal with
  | |- ?P => apply (E_exists_th _ phi P); [ idtac | let t := fresh "t" in let ht := fresh "Ht" in intros t ht ]
  end.

Ltac TE :=
  unfold not;
  match goal with
  | |- (?P \/ (?P -> False)) => exact (classic P)
  | _                        => fail
  end.

Theorem E_antiT_th : forall (phi : Prop), False -> phi.
intros Pphi F.
elim F.
Qed.

Ltac E_antiT :=
  match goal with
  | |- ?P => apply (E_antiT_th P)
  end.

Theorem I_antiT_th : forall (phi : Prop), phi -> (~phi) -> False.
unfold not.
intro Pphi.
intros Hphi Hnphi.
cut Pphi.
Hyp Hnphi.
Hyp Hphi.
Qed.

Ltac I_antiT phi :=
 match goal with
 | |- False => apply (I_antiT_th phi)
 end.

Theorem I_non_th : forall (phi : Prop), (phi -> False) -> ~phi.
intros.
unfold not.
exact H.
Qed.

Ltac I_non Nom :=
 match goal with
 | |- ~ ?P => apply (I_non_th P); intro Nom
 end.

Ltac E_non phi :=
 apply (I_antiT_th phi).

Ltac absurde Nom :=
 match goal with
 | |- ?P => apply (NNPP P); intro Nom
 end.

(*
Ltac I_antiT phi := apply (I_antiT_th phi).

Ltac absurde Nom phi :=
match goal with
| |- phi =>
cut (phi \/ ~phi);
[
intros L;
elim L;
[
auto
|
clear L;
intro Nom;
apply (E_antiT_th)
]
|
apply (classic phi)
]
| _ => fail
end.
*)

