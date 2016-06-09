function makeSeq(n)
% Randomly generates a light sequence
    
    myhandles = guidata(gcbo);
    
    % Define a color map to be used for random sequence generation
    myhandles.color_map = {'1','2','3','4'};
    myhandles.color_seq = {};
    
    if n <= 7
        % Generate a random ordering of the numbers in the set [1 to 4]
        sequence_perm = randi(4,n);
        % Get the corresponding colors 
        for x = 1:n
            myhandles.color_seq{x} = myhandles.color_map{sequence_perm(x)};
        end
        
    else
        
        l = floor(n/4); % use repeating patterns of 4   
        m = mod(n,4);   
        
        % Generate a random ordering of the numbers in the set [1 to 4]
        sequence_perm = randi(4,4);
        
        % Get the corresponding colors for the repeating patterns of four
        for y = 0:l-1
            for x = 1:4
                myhandles.color_seq{4*y+x} = myhandles.color_map{sequence_perm(x)};
            end
        end
        
        % Get the remainder of the sequence
        sequence_perm = randi(4,m);
        for z = 1:m
            myhandles.color_seq{4*l + z} = myhandles.color_map{sequence_perm(z)};
        end
    end
    
    % Save the enviroment data
    guidata(gcbo,myhandles);