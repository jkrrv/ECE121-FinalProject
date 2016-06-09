function start_round
% Plays back a random sequence of lights, then tells main GUI to await user
% input

% Load in the data structure
handles = guidata(gcbo);
    
% For initalizing the game to a sequence of 4
if strcmp(handles.newGame, 'True')
    makeSeq(4);
    handles = guidata(gcbo);
    handles.newGame = 'False';
end

% Init a datastructure to record the user input for the current round
handles.userInput = [];

% Game is in sequence so hide the 'Play' pushbutton 
set(handles.pushbutton_start,'visible','off');
set(handles.text_result, 'Visible', 'off');

% Create a datastructure for the current sequence
handles.num_sequence = [];

brief_delay = 0.4; % delay duration after sound/light sequence

for m=1:length(handles.color_seq)
    
    % This portion of the code handles changing the current light
    % color as well as playing the test tone
    switch handles.color_seq{m}
        
        case '1'
            axes(handles.axes_1);             
            fill([0 1 1 0],[0 0 1 1],handles.axes_1_color);     
            axis off                           
            play(handles.play_tone1);
            pause(handles.dur)       
            
            fill([0 1 1 0],[0 0 1 1],handles.background_color);
            axis off                            
            pause(brief_delay)                 
            handles.num_sequence(end+1) = 1;  % Add sequence to 'key' vector
            
        case '2'
            axes(handles.axes_2); 
            fill([0 1 1 0],[0 0 1 1],handles.axes_2_color); 
            axis off
            play(handles.play_tone2);
            pause(handles.dur);
            
            fill([0 1 1 0],[0 0 1 1],handles.background_color);
            axis off
            pause(brief_delay);
            handles.num_sequence(end+1) = 2;
            
        case '3'
            axes(handles.axes_3); 
            fill([0 1 1 0],[0 0 1 1],handles.axes_3_color); 
            axis off
            play(handles.play_tone3);
            pause(handles.dur);
            
            fill([0 1 1 0],[0 0 1 1],handles.background_color);
            axis off
            pause(brief_delay);
            handles.num_sequence(end+1) = 3;
            
        case '4'
            axes(handles.axes_4); 
            fill([0 1 1 0],[0 0 1 1],handles.axes_4_color); 
            axis off
            play(handles.play_tone4);
            pause(handles.dur);
            
            fill([0 1 1 0],[0 0 1 1],handles.background_color);
            axis off
            pause(brief_delay);
            handles.num_sequence(end+1) = 4;
    end
end        

% Record the user's input
handles.inSeq = 'True';   % Now we're recording the user input

% Save the enviroment data
guidata(gcbo, handles);

% Start the timer
tic
