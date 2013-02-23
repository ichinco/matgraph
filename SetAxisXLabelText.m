function [ ] = SetAxisXLabelText( axisNumber, text )
    axisHandle = GetNthAxis(axisNumber);    

    xlab = get(axisHandle,'XLabel');
    set(xlab,'String', text{:});    
end