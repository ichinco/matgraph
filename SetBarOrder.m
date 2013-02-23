function [ ] = SetBarOrder( axisNumber, newOrder )
    axisHandle = GetNthAxis(axisNumber);    
    nTicks = length(get(axisHandle,'XTickLabel'));

    children = get(axisHandle,'Children');
    xdata = zeros(4,3,length(newOrder)); %% x-data is 4x3
    ydata = zeros(4,3,length(newOrder)); %% y-data is 4x3
    lineOrder = zeros(1,length(newOrder));

    %%bar order
    i=1;
    for c=1:length(children),
        child = children(c);
        if (strcmp(get(child,'Type'),'patch')==1)
            xdata(1:4,1:3,i) = get(child,'XData');
            ydata(1:4,1:3,i) = get(child,'YData');
            lineOrder(i) = xdata(1,1,i);
            i = i+1;
        end
    end

    [lineOrder, rank] = sort(lineOrder);

    i=1;
    for c=1:length(children),
        child = children(c);
        if (isprop(child,'FaceColor')==1)
            myIndex = newOrder(lineOrder == xdata(1,1,i));
            childIndex = rank == myIndex;

            set(child,'YData',ydata(1:4,1:3,childIndex));
            set(child,'XData',xdata(1:4,1:3,i));
            set(child,'FaceVertexCData',myIndex);
            set(child,'CData',myIndex);
            i=i+1;
        end
    end      

    %% error bar order
    nTicks = length(get(axisHandle,'XTick'));
    for c=1:length(children),
        child = children(c);
        if (isprop(child,'LineStyle')==1 && length(get(child,'YData'))==9*nTicks*length(newOrder))
            ydata = get(child,'YData');
            newydata = ydata;

            xdata = get(child,'XData');
            xind = xdata(mod((1:9*nTicks*length(newOrder))-1,9)==1);
            [~,xorder] = sort(xind);

            for i=1:3,
                for j=1:length(newOrder),
                    newindex = newOrder(j);
                    oldIndex = ((i-1)*length(newOrder))+j;
                    thisIndex = xorder(oldIndex);
                    newIndex = ((i-1)*length(newOrder))+newindex;
                    thatIndex = xorder(newIndex);
                    %[i,j,newindex,oldIndex,thisIndex,newIndex,thatIndex];
                    for k=1:9,

                        thisAbsoluteIndex = (thisIndex-1)*9+k;
                        thatAbsoluteIndex = (thatIndex-1)*9+k;

                        newydata(thisAbsoluteIndex) = ydata(thatAbsoluteIndex);
                    end
                end
            end
            set(child,'YData',newydata);
            set(child,'XData',xdata);
        end
    end

end