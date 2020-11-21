let get = fullPath => {
  fullPath
  |> Js.String.replaceByRe([%re "/^.*[\\\/]/"], "")
  |> Js.String.slice(~from=0, ~to_=-3);
};
