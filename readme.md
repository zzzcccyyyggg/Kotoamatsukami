```
py::class_<config_t>(m, "config_t",
  R"delim(
  This class is used to configure the global behavior of O-MVLL.

  It can be accessed through the global :attr:`omvll.config` attribute
  )delim")

```
原始字符串（Raw String）：在 C++ 中，原始字符串是以 R"标识符(字符串内容)标识符" 的形式表示的，标识符 可以是任意用户选择的标识符，用于标识字符串的边界。这样字符串内容中的字符（例如引号、换行符等）就不需要转义。
delim 标识符：在这个例子中，delim 只是一个自定义的标识符，用于表示字符串的边界。它可以是任何有效的标识符。