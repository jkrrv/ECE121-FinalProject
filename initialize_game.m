function out = initialize_game(handles)
% Sets up parameters regarding visual and auditory feedback to the user.
% Parameters include colors of each 'light', frequency/amplitude of each
% tone, and tone duration.
    
% ----------------------------------------------------------------
% == Parameters: =================================================
% ----------------------------------------------------------------

% Colors (RGB)
handles.background_color_1 = [255 223 234] ./ 255;   % Default
handles.background_color_2 = [223 224 255] ./ 255;  
handles.background_color_3 = [223 255 225] ./ 255;  
handles.background_color_4 = [255 254 202] ./ 255; 
handles.axes_1_color = [240 0 0] ./ 255;      % Lighted state colors
handles.axes_2_color = [0 6 255] ./ 255;
handles.axes_3_color = [0 255 13] ./ 255;
handles.axes_4_color = [255 249 0] ./ 255;

% Test tone parameters
handles.fs = 44.1e3;            % Sampling rate (44.1kHz)
handles.dur  = 0.3;             % Normal tone duration
handles.dur_short = 0.3;      % Short tone duration

handles.amp_1 = 1;              % Tone amplitudes
handles.amp_2 = 1;
handles.amp_3 = 1;
handles.amp_4 = 1;

handles.f0_1 = 261.626;              % Tone frequencies (Hz)
handles.f0_2 = 293.665;
handles.f0_3 = 329.628;
handles.f0_4 = 349.228;


% ----------------------------------------------------------------
% DO NOT edit anything below this line unless you know what you're
% doing

% Fill in the four color boxes with the background color
% axes(handles.axes_1);
% fill([0 1 1 0],[0 0 1 1], 'k');
% axis off
% axes(handles.axes_2);
% fill([0 1 1 0],[0 0 1 1], 'k');
% axis off
% axes(handles.axes_3);
% fill([0 1 1 0],[0 0 1 1], 'k');
% axis off
% axes(handles.axes_4);
% fill([0 1 1 0],[0 0 1 1], 'k');
% axis off

% Call helper function defined below to synthsize test tones
handles.tone1 = generateTestTone(handles.f0_1, handles.amp_1, handles.dur, handles.fs);
handles.tone2 = generateTestTone(handles.f0_2, handles.amp_2, handles.dur, handles.fs);
handles.tone3 = generateTestTone(handles.f0_3, handles.amp_3, handles.dur, handles.fs);
handles.tone4 = generateTestTone(handles.f0_4, handles.amp_4, handles.dur, handles.fs);

% Create audioplayer objects for each test tone
handles.play_tone1 = audioplayer(handles.tone1, handles.fs);
handles.play_tone2 = audioplayer(handles.tone2, handles.fs);
handles.play_tone3 = audioplayer(handles.tone3, handles.fs);
handles.play_tone4 = audioplayer(handles.tone4, handles.fs);

% Define an array to contain user data (sequence length, time required 
% for user to enter sequence)
handles.userdata = [];

% Flags
handles.newGame = 'True';   % We've started a new game
handles.inSeq = 'False';    % Not currently recording user input

out = handles; 

end

    
    
function y = generateTestTone(freq, amp, T, fs)
% Create a test tone with the specified parameters

A = 1:10;                       % Denominator of amplitude                   
f = freq.*A;                    % Harmonics

t = (0:round(fs*T)-1) / fs;          % Time vector
y = zeros(1,round(fs*T));            % Preallocate y

% Use superposition to add harmonics
for n = 1:length(A)
    y = y + 1/A(n) * cos(2*pi*f(n).*t);
end

% Create an envelope
envLen = round(441);    
env = hanning(envLen * 2)';
env = env(1:envLen);

% Shape the sinusoid
y(1:envLen) = y(1:envLen) .* env;
y(end-envLen+1:end) = y(end-envLen+1:end) .* fliplr(env);

% Make sure it does not clip
y = y ./ max(abs(y));

% Scale by the specified amplitude
y = y * amp;

end