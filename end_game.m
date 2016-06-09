function end_game
% Prints performance information to the command line

fprintf('Game Ended \n')

% Load in the game data
myhandles = guidata(gcbo);
if size(myhandles.userdata,1) > 0

    fprintf('\n \n \n Performance Summary: \n \n')

    for n=1:size(myhandles.userdata(:,1),1)
        fprintf('Successfully completed sequence %i in %1.3f seconds \n', ... 
                myhandles.userdata(n,1), myhandles.userdata(n,2))
    end

    fprintf(' \n Average time per click: %1.3f \n \n', ...
        mean(myhandles.userdata(:,2) ./ myhandles.userdata(:,1)))
end

close all
