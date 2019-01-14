syn match cssFontProp contained "--[A-Za-z_][A-Za-z0-9_-]*"
syn region cssFunction contained matchgroup=cssFunctionName start="\<var\s*(" end=")" oneline keepend
syn region cssFunction contained matchgroup=cssFunctionName start="\<env\s*(" end=")" oneline keepend
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(linear-\|radial-\)\=\gradient\s*(" end=")" contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunction,cssGradientAttr,cssFunctionComma
syn match cssMediaProp contained /prefers-color-scheme/
