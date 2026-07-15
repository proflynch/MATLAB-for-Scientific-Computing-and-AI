% Prog_18d.m: EEG Spectral Changes (Alpha Wave Desynchronisation).
% Context: Educational Psychology - Tracking cognitive load and attention.
% Parameter Setup.
Fs=250;                       % Sampling rate (Hz).
duration=12;                  % Total experiment duration (seconds).
t=0:(1/Fs):(duration-1/Fs);   % Time vector.
N=length(t);                  % Total data points.
% Define psychological phase transitions (in seconds).
task_start=4.0;
task_end  =8.0;
% Simulate Brain States (Time-Varying Spectral Data).
% Background sensor noise (broadband white noise).
eeg_signal=1.8*randn(1,N);
% Generate continuous frequencies to manipulate.
alpha_frequency=10; % 10 Hz Alpha wave (Relaxation/Idle).
beta_frequency =22; % 22 Hz Beta wave  (Active Focus/Stress).
% Construct the dynamic signal based on the student's cognitive state.
for i=1:N
    current_time=t(i);
    if current_time>=task_start && current_time<task_end
        % Cognitive Load / Task Focus (4s to 8s).
        % Alpha waves drop out (Desynchronisation). Beta waves increase.
        alpha_amplitude=0.3; 
        beta_amplitude =1.5; 
    else
        % PHASES 1 & 3: Relaxed / Eyes Closed (0s-4s, 8s-12s).
        % Alpha waves are highly prominent. Beta waves are quiet.
        alpha_amplitude=2.5; 
        beta_amplitude =0.2; 
    end
    % Inject the shifting oscillations into the raw timeline.
    eeg_signal(i)=eeg_signal(i)+...
        alpha_amplitude*sin(2*pi*alpha_frequency*current_time)+...
        beta_amplitude*sin(2*pi*beta_frequency*current_time);
end
% Visualization: Time-Domain vs. Frequency-Domain.
figure('Name', 'Psychological EEG Spectral Analysis', 'Color', [1 1 1]);

% Raw Continuous Time-Series EEG.
subplot(2,1,1);
plot(t,eeg_signal,'Color',[0.2 0.2 0.2],'LineWidth',0.8); 
hold on;
% Highlight the psychological task window visually.
y_limits=ylim;
patch([task_start task_end task_end task_start], ...
    [y_limits(1) y_limits(1) y_limits(2) y_limits(2)], ...
    [1 0.9 0.9], 'EdgeColor', 'none', 'FaceAlpha', 0.5);
% Replot signal over the patch so it stays visible
plot(t,eeg_signal,'Color',[0.1 0.5 0.7],'LineWidth',0.8);
xline(task_start,'--r','Eyes Open','LabelVerticalAlignment','bottom');
xline(task_end,'--r','Task Ends','LabelVerticalAlignment','bottom');
title('Raw EEG Timeline: Relaxed vs. Cognitive Task States');
xlabel('Time (seconds)'); ylabel('Amplitude (\muV)');
grid on; xlim([0 duration]);
set(gca,'FontSize',15)
% Spectrogram (Time-Frequency Analysis).
subplot(2,1,2);
window_len=round(1.0 * Fs);  % 1-second moving window
overlap   =round(0.9 * Fs);  % 90% overlap for smooth visuals
nfft      =512;              % FFT points
% Calculate the spectrogram using MATLAB's built-in signal processing function
[S,F,T,P]=spectrogram(eeg_signal,window_len,overlap,nfft,Fs);
% Convert power to decibels (dB) for enhanced visual contrast.
P_dB=10*log10(P);
% Display the time-frequency map.
imagesc(T,F,P_dB); 
axis xy; % Correct the vertical axis orientation.
colormap('jet');
colorbar_handle = colorbar;
ylabel(colorbar_handle, 'Power Spectral Density (dB)');
% Clean up the view to focus on relevant psychological frequencies (0-35 Hz).
ylim([0 35]); 
xline(task_start,'-w','LineWidth',1.5);
xline(task_end,'-w','LineWidth', 1.5);
title('Brain Spectrogram: Visualizing Alpha Blocking & Beta Activation');
xlabel('Time (seconds)'); ylabel('Frequency (Hz)');
set(gca,'FontSize',15)
% End Prog_18d.m.