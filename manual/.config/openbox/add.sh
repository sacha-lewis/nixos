#!/bin/bash
# figure out how to auto add the missing children to the xml file

# Input XML file
INPUT_XML="original.xml"
TEMP_XML="temp.xml"

# XPath expression to find parent elements without a child
XPATH_EXPRESSION="//parent[not(child)]"

# Use xmlstarlet to add missing <child> elements
xmlstarlet ed -L -s "$XPATH_EXPRESSION" -t elem -n child -v "default_value" "$INPUT_XML"

echo "Missing elements have been added."

# Optional: Validate the modified XML
xmllint --noout "$INPUT_XML"
if [ $? -eq 0 ]; then
    echo "XML is valid."
else
    echo "XML is not valid."
fi
