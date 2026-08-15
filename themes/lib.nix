# Shared formatters for every palette. Values are bare RRGGBB so each
# consumer can add the prefix and alpha its own config format expects.
{
  rasi = c: "#${c}FF";
  css = c: "#${c}";
  hypr = c: a: "rgba(${c}${a})";
}
