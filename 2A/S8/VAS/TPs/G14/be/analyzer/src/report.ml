(*
 * TINY (Tiny Is Not Yasa (Yet Another Static Analyzer)):
 * a simple abstract interpreter for teaching purpose.
 * Copyright (C) 2012  P. Roux
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)

exception Error

let verbosity = ref 1

let nlogf n =
  if n <= !verbosity then
    Format.kfprintf
      (fun ff ->
        Format.kfprintf
          (fun ff -> Format.fprintf ff "@]\n%!")
          ff)
      Format.err_formatter
      "%s@[" (if n >= 4 then String.make (2 * (n - 3)) ' ' else "")
  else
    Format.ifprintf
      Format.err_formatter

let kstr k str =
  Format.kfprintf
    (fun ff ->
      Format.kfprintf
        (fun ff -> Format.fprintf ff "\n%!"; k ff)
        ff)
    Format.err_formatter
    "%s" str

let kstr_loc k str loc =
  Format.kfprintf
    (fun ff ->
      Format.kfprintf
        (fun ff -> Format.fprintf ff "\n%!"; k ff)
        ff)
    Format.err_formatter
    "%a%s" Location.fprint loc str

let warning f = kstr (fun _ -> ()) "Warning: " f

let warning_loc loc f = kstr_loc (fun _ -> ()) "Warning: " loc f

let error f = kstr (fun _ -> raise Error) "Error: " f

let error_loc loc f = kstr_loc (fun _ -> raise Error) "Error: " loc f

let silent f =
  let old_verbosity = !verbosity in
  verbosity := 0;
  let res = f () in
  verbosity := old_verbosity;
  res
