function [ ] = SetAxisXLabelTicks( axisNumber, ticks )
    axisHandle = GetNthAxis(axisNumber);    

    set(axisHandle,'XTickLabel', ticks);    
end