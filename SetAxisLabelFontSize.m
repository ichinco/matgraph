function [ ] = SetAxisLabelFontSize( axisNumber, fontSize )
    axisHandle = GetNthAxis(axisNumber);    
    xlab = get(axisHandle,'XLabel');
    set(xlab,'FontSize',fontSize);
    ylab = get(axisHandle,'YLabel');
    set(ylab,'FontSize',fontSize);    
end