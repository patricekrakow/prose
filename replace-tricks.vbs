If WScript.Arguments.Count = 1 Then
  Dim strFileName: strFileName = WScript.Arguments.Item(0)
Else
  WScript.Echo("Usage: cscript replace-trick.vbs filename")
  WScript.Quit(1)
End If

Const ForReading = 1, ForWriting = 2
Dim fso: Set fso = CreateObject("Scripting.FileSystemObject")
Dim file: Set file = fso.OpenTextFile(strFileName, ForReading)
Dim str: str = file.ReadAll
file.Close
Set file = Nothing
'-- 1st trick :-/
str = Replace(str, " xmlns:pro=""http://prose.foo/2016-02-19/1/""", _
                   "")
'-- 2nd trick :-/
str = Replace(str, " xmlns:xsl=""urn-to-be-replaced""", _
                   " xmlns:xsl=""http://www.w3.org/1999/XSL/Transform""")
'-- End of the tricks ;-)
Set file = fso.OpenTextFile(strFileName, ForWriting)
file.Write str
file.Close
Set file = Nothing
Set fso = Nothing
WScript.Echo("Done.")
