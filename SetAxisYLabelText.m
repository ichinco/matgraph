function [ ] = SetAxisYLabelText( axisNumber, text )
    axisHandle = GetNthAxis(axisNumber);    

    ylab = get(axisHandle,'YLabel');
    set(ylab,'String', text{:});    
end