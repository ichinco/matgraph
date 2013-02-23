function [ ] = SetAxisLabelFontWeight( axisNumber, fontWeight )
    axisHandle = GetNthAxis(axisNumber);    
    xlab = get(axisHandle,'XLabel');
    set(xlab,'FontWeight',fontWeight);
    ylab = get(axisHandle,'YLabel');
    set(ylab,'FontWeight',fontWeight);    
end