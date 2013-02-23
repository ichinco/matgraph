function [ ] = SetAxisFontSize( axisNumber, fontSize )
    axisHandle = GetNthAxis(axisNumber);
    set(axisHandle,'FontSize',fontSize);
end