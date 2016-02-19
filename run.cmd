@echo off

echo __ Generate "generated.formatA-to-formatB.xsl"...
msxsl commitments-to-ontology.xml prose.xsl -o generated.formatA-to-formatB.xsl -t source=formatA result=formatB
echo __ Replace tricks on "generated.formatA-to-formatB.xsl"...
cscript replace-tricks.vbs generated.formatA-to-formatB.xsl
rem msxsl commitments-to-ontology.xml prose.xsl -o generated.formatA-to-formatC.xsl -t source=formatA result=formatC
rem msxsl commitments-to-ontology.xml prose.xsl -o generated.formatB-to-formatA.xsl -t source=formatB result=formatA
rem msxsl commitments-to-ontology.xml prose.xsl -o generated.formatB-to-formatC.xsl -t source=formatB result=formatC
rem msxsl commitments-to-ontology.xml prose.xsl -o generated.formatC-to-formatA.xsl -t source=formatC result=formatA
rem msxsl commitments-to-ontology.xml prose.xsl -o generated.formatC-to-formatB.xsl -t source=formatC result=formatB

echo __ Map "formatA.instance.xml" to "formatB.instance.mapped-from-formatA.xml"...
msxsl formatA.instance.xml generated.formatA-to-formatB.xsl -o formatB.instance.mapped-from-formatA.xml -t
rem msxsl formatA.instance.xml generated.formatA-to-formatC.xsl -o formatC.instance.mapped-from-formatA.xml -t

pause
