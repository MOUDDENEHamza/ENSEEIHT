(** A module type for relational domains. *)

(** Module type for relational domains. *)
module type Domain = sig
  (** Name of the domain. Used to select it via command line
      arguments. Should be of the form \[a-z\]\[a-zA-Z0-9_\]*. *)
  val name : string

  (** Underlying non relational domain when available *)
  val nonrel_base : (module NonRelational.Domain) option
						
  (** [parse_param s] parses parameters in [s]. If [s] is of the form
      "dom:s'" where dom doesn't contain ':' and is not [name], the
      parameter should be ignored. If dom is [name], only s' should be
      considered ([Utils.select_param name] can be used for that). A
      warning should be issued for unrecognised parameters (use
      [Utils.warn_unknown_param]). *)
  val parse_param : string -> unit

  (** Outputs some help about the options recognized by
      [parse_param]. *)
  val fprint_help : Format.formatter -> unit

  (** Type of abstract values. *)
  type t

  (** Prints an abstract value. *)
  val fprint : Format.formatter -> t -> unit

  (** {2 Lattice Structure} *)

  (** Order on type [t]. [t] with this order must be a lattice. *)
  val order : t -> t -> bool

  val top : Name.Set.t -> t
  val bottom : Name.Set.t -> t
  val is_bottom : t -> bool

  val get_vars: t -> Name.Set.t
  (** Infimums of the lattice (when the relational domain focuses on given set
      of variables). *)

  val join : t -> t -> t
  val meet : t -> t -> t
  (** Least upper bound and greatest lower bound of the lattice. *)

  (** Widening to ensure termination of the analyses. *)
  val widening : t -> t -> t

  (** {2 Abstract Operators} *)

  (** Abstract semantics of assignments and guards. *)

  (** [assignment n e t] returns a [t'] such that:
      {[[|n = e;|](\gamma(t)) \subseteq \gamma(t').]} *)
  val assignment : Name.t -> Ast.expr -> t -> t

  (** [guard e t] returns a [t'] such that:
      {[[|e >= 0|](\gamma(t)) \subseteq \gamma(t').]}*)
  val guard : Ast.expr -> t -> t
end

(** Product functor for relational domains. *)
module Prod (D1: Domain) (D2: Domain) : Domain 

(** Functor to build relational domains from non relational ones
    (by pointwise extension). *)
module MakeRelational (D : NonRelational.Domain) : Domain
