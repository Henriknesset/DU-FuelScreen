{"slots":{"0":{"name":"slot1","type":{"events":[],"methods":[]}},"1":{"name":"slot2","type":{"events":[],"methods":[]}},"2":{"name":"slot3","type":{"events":[],"methods":[]}},"3":{"name":"slot4","type":{"events":[],"methods":[]}},"4":{"name":"slot5","type":{"events":[],"methods":[]}},"5":{"name":"slot6","type":{"events":[],"methods":[]}},"6":{"name":"slot7","type":{"events":[],"methods":[]}},"7":{"name":"slot8","type":{"events":[],"methods":[]}},"8":{"name":"slot9","type":{"events":[],"methods":[]}},"9":{"name":"slot10","type":{"events":[],"methods":[]}},"-1":{"name":"unit","type":{"events":[],"methods":[]}},"-2":{"name":"system","type":{"events":[],"methods":[]}},"-3":{"name":"library","type":{"events":[],"methods":[]}}},"handlers":[{"code":"--Configuration for this script can be found in the start() function in the menu to your left\n--Edit code in this section at your own risk\n\nfunction update()\n    barAndTextHeight = (1120-120)/(#spaceTanks + #atmoTanks)\n    spaceSVG=[[]]\n    numBars=0\n    spaceFuelPercents = {}\n    for i=1,#spaceTanks,1 do\n        spaceFuelPercents[i] = 1890*((json.decode(spaceTanks[i].getData()).percentage)/100)\n        spaceSVG = spaceSVG..[[<text x=\"15\" y=\"]]..120+(numBars * barAndTextHeight)..[[\" font-size=\"40\" text-anchor=\"start\" fill=\"]]..spaceNameColor..[[\">]]..spaceTankNames[i]..[[</text>\n\t\t                     <rect x=\"15\" y=\"]]..135+(numBars * barAndTextHeight)..[[\" width=\"1890\" height=\"]]..(barAndTextHeight-60)..[[\" fill=\"]]..backgroundColor..[[\" stroke=\"]]..borderColor..[[\" stroke-width=\"5\"/>\n\t\t                     <rect x=\"15\" y=\"]]..135+(numBars * barAndTextHeight)..[[\" width=\"]]..spaceFuelPercents[i]..[[\" height=\"]]..(barAndTextHeight-60)..[[\" fill=\"]]..spaceBarColor..[[\" stroke-width=\"0\"/>]]\n        numBars = numBars+1\n    end\n    atmoSVG=[[]]\n    atmoFuelPercents = {}\n    for i=1,#atmoTanks,1 do\n        atmoFuelPercents[i] = 1890*((json.decode(atmoTanks[i].getData()).percentage)/100)\n        atmoSVG = atmoSVG..[[<text x=\"15\" y=\"]]..120+(numBars * barAndTextHeight)..[[\" font-size=\"40\" text-anchor=\"start\" fill=\"]]..atmoTextColor..[[\">]]..atmoTankNames[i]..[[</text>\n\t\t\t\t\t    <rect x=\"15\" y=\"]]..135+(numBars * barAndTextHeight)..[[\" width=\"1890\" height=\"]]..(barAndTextHeight-60)..[[\" fill=\"]]..backgroundColor..[[\" stroke=\"]]..borderColor..[[\" stroke-width=\"5\"/>\n\t\t\t\t\t    <rect x=\"15\" y=\"]]..135+(numBars * barAndTextHeight)..[[\" width=\"]]..atmoFuelPercents[i]..[[\" height=\"]]..(barAndTextHeight-60)..[[\" fill=\"]]..atmoBarColor..[[\" stroke-width=\"0\"/>]]\n        numBars = numBars+1\n    end\n\n\n    \n    svg = [[<svg class=\"bootstrap\" viewBox=\"0 0 1920 1120\" style=\"width:100%; height:100%\"><svg version=\"1.1\" baseProfile=\"full\" xmlns=\"http://www.w3.org/2000/svg\">\n  \n\t<rect width=\"100%\" height=\"100%\" fill=\"]]..backgroundColor..[[\" />\n\n \t<text x=\"15\" y=\"55\" font-size=\"60\" text-anchor='start' fill=\"]]..headerColor..[[\">]]..windowName..[[</text>\n    \n \t<line x1=\"0\" x2=\"1920\" y1=\"75\" y2=\"75\" stroke=\"]]..borderColor..[[\", fill=\"]]..borderColor..[[\"/>\n\t\n\t]]..spaceSVG..[[\n\n\t]]..atmoSVG..[[\n\n\t</svg></svg>]]\n\n\tfor i=1,#screens,1 do\n     \tscreens[i].setSVG(svg)\n\tend\n    \nend\n\nupdate()\n\n\n\n\n","filter":{"args":[{"value":"updateFuelDisplay"}],"signature":"tick(timerId)","slotKey":"-1"},"key":"0"},{"code":"--Script Information----------------------------------------------------------------------------------------------------------------------\n--Version: 1.3\n--Supports: \n     --Any amount of atmo or space tanks, to a total of 8\n     --Rocket Tanks coming soon(have to get one or two to test)\n--Created by: Rost\n--For Support:\n     --Discord: Rost#6764\n     --Ingame: RostNerd\n\n--Script Configuration--------------------------------------------------------------------------------------------------------------------\n\n--Debug Mode(prints extra values to help with troubleshooting)\ndebug = false\n\n--Update Speed(rate at which the screen updates in seconds\nupdateSpeed = 1 --export\n\n--Header Text\nwindowName = \"Fuel Management\" --export\n\nspaceTankNames = {}\n--Name of Space Tank 1\nspaceTankNames[1] = \"Space Tank 1\" --export\n\n--Name of Space Tank 2\nspaceTankNames[2] = \"Space Tank 2\" --export\n\n--Name of Space Tank 3\nspaceTankNames[3] = \"Space Tank 3\" --export\n\n--Name of Space Tank 4\nspaceTankNames[4] = \"Space Tank 4\" --export\n\n--Name of Space Tank 5\nspaceTankNames[5] = \"Space Tank 5\" --export\n\n--Name of Space Tank 6\nspaceTankNames[6] = \"Space Tank 6\" --export\n\n--Name of Space Tank 7\nspaceTankNames[7] = \"Space Tank 7\" --export\n\n--Name of Space Tank 8\nspaceTankNames[8] = \"Space Tank 8\" --export\n\natmoTankNames = {}\n--Name of Atmo Tank 1\natmoTankNames[1] = \"Atmospheric Tank 1\" --export\n\n--Name of Atmo Tank 2\natmoTankNames[2] = \"Atmospheric Tank 2\" --export\n\n--Name of Atmo Tank 3\natmoTankNames[3] = \"Atmospheric Tank 3\" --export\n\n--Name of Atmo Tank 4\natmoTankNames[4] = \"Atmospheric Tank 4\" --export\n\n--Name of Atmo Tank 5\natmoTankNames[5] = \"Atmospheric Tank 5\" --export\n\n--Name of Atmo Tank 6\natmoTankNames[6] = \"Atmospheric Tank 6\" --export\n\n--Name of Atmo Tank 7\natmoTankNames[7] = \"Atmospheric Tank 7\" --export\n\n--Name of Atmo Tank 8\natmoTankNames[8] = \"Atmospheric Tank 8\" --export\n\n--Background Color\nbackgroundColor = \"#2f343d\" --export\n\n--Bar Border Color\nborderColor = \"white\" --export\n\n--Header Text Color\nheaderColor = \"white\" --export\n\n--Space Text Color\nspaceNameColor = \"orange\" --export\n\n--Space Bar Color\nspaceBarColor = \"orange\" --export\n\n--Atmo Text Color\natmoTextColor = \"#34b1eb\" --export\n\n--Atmo Bar Color\natmoBarColor = \"#34b1eb\" --export\n\n--Script Configuration Done--Modifications beyond here are at your own risk--\n------------------------------------------------------------------------------------------------------------------    \nfunction insertionSort(array)-- Basic insertion sort algorithm used to sort the spaceTanks and atmoTanks arrays\n    local len = #array\n    local j\n    for j = 2, len do\n        local key = array[j]\n        local i = j - 1 --The line below sorts the array using the name field of the tank for consistent results\n        while i > 0 and json.decode(array[i].getData()).name > json.decode(key.getData()).name do\n            array[i + 1] = array[i]\n            i = i - 1\n        end\n        array[i + 1] = key\n    end\n    return array\nend\n\natmoTanks = {}\n\nfor key, value in pairs(unit) do\n  if type(value) == \"table\" and type(value.export) == \"table\" then -- `value` is an element and `key` is the slot name\n    if value.getElementClass then --if it has a class\n      if value.getElementClass() == \"AtmoFuelContainer\" then --if it's an atmo tank\n          atmoTanks[#atmoTanks + 1] = value\n      end\n    end\n  end\nend \n\n\natmoTanks = insertionSort(atmoTanks)\n--We're required to sort the atmoTanks array, as the code that gets it is not consistent, and\n--due to some unknown value, the order of the tanks is randomized.\n--by sorting the array by the name of the tank, we can verify a consistent order every time\n\nspaceTanks = {}\nfor key, value in pairs(unit) do\n  if type(value) == \"table\" and type(value.export) == \"table\" then -- `value` is an element and `key` is the slot name\n    if value.getElementClass then --if it has a class\n      if value.getElementClass() == \"SpaceFuelContainer\" then --if it's a space tank\n           spaceTanks[#spaceTanks + 1] = value \n      end\n    end\n  end\nend \n\nspaceTanks = insertionSort(spaceTanks)\n--We're required to sort the spaceTanks array, as the code that gets it is not consistent, and\n--due to some unknown value, the order of the tanks is randomized.\n--by sorting the array by the name of the tank, we can verify a consistent order every time\n\nscreens = {}\n\nfor key, value in pairs(unit) do\n  if type(value) == \"table\" and type(value.export) == \"table\" then -- `value` is an element and `key` is the slot name\n    if value.getElementClass then -- if it has a class\n      if value.getElementClass() == \"ScreenUnit\" then --if it's a screen\n           screens[#screens + 1] = value\n      end\n    end\n  end\nend \n\nif debug then\n    system.print('Number of Screens: '..#screens)\n    system.print('Number of Space Tanks: '..#spaceTanks)\n    system.print('Number of Atmospheric Tanks: '..#atmoTanks)\nend\n\n\n\nunit.setTimer('updateFuelDisplay',updateSpeed)","filter":{"args":[],"signature":"start()","slotKey":"-1"},"key":"1"}],"methods":[],"events":[]}