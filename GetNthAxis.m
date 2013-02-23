function [ axisHandle ] = GetNthAxis( n )
    %% get all non-legend, non-colorbar axes
    allAxesInFigure = findall(gcf,'type','axes','-not','Tag','legend','-not','Tag','Colorbar');
    
    %% get positions of the axes on the graph so we can sort them
    allAxesInFigure(:,2:3) = zeros(length(allAxesInFigure),2);
    [l,~,~] = size(allAxesInFigure);
    for a=1:l,
        axis = allAxesInFigure(a,1);
        position = get(axis,'Position');
        allAxesInFigure(a,2:3) = position(1:2);
    end
    
    sortedAxes = sortrows(allAxesInFigure,[-3,2]);
    
    axisHandle = sortedAxes(n,1);
end