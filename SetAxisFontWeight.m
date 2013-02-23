function [ ] = SetAxisFontSize( axisNumber, fontWeight )
    axisHandle = GetNthAxis(axisNumber);
    set(axisHandle,'FontWeight',fontWeight);
end