% Clear the command window, close all figures, and clear workspace
clear;
clc;
close all;

% Input user-defined parameters
E0 = input('Enter the amplitude of the electric field (E0): ');
omega = input('Enter the angular frequency (omega): ');
beta = input('Enter the propagation constant (beta): ');
phi = input('Enter the phase angle (phi): ');

% Intrinsic impedance of the medium (typically around 377 ohms for a lossy medium)
eta = 377;

% Time values
t = linspace(0, 2*pi, 1000); % Create an array of time values from 0 to 2*pi

% Calculate Electric and Magnetic Fields
Ex = E0 * cos(omega * t - beta * t + phi); % Electric field in x-direction
Hy = (E0 / eta) * cos(omega * t - beta * t + phi); % Magnetic field in y-direction

% Create an animated line for electric field (Xline), magnetic field (Yline),
% and wave propagation (Zline)
Xline = animatedline('LineWidth', 2, 'Color', 'b', 'DisplayName', 'Electric Field');
Yline = animatedline('LineWidth', 2, 'Color', 'r', 'DisplayName', 'Magnetic Field');
Zline = animatedline('LineWidth', 2, 'Color', 'g', 'DisplayName', 'Wave Propagation');

% Set the axis limits and add labels to the plot
axis([0, 2*pi, -2, 3]);
title('Electric and Magnetic Fields of a Plane Wave');
xlabel('Time');
ylabel('Amplitude');
zlabel('Propagation direction');

% Set the view for 3D visualization
view(45, 20);

% Loop through the time values to update the animated lines
for i = 1:length(t)
    addpoints(Zline, t(i), 0, 0); % Plot the wave propagation
    addpoints(Yline, t(i), 0, Hy(i)); % Plot the magnetic field
    drawnow; % Update the plot
    addpoints(Xline, t(i), Ex(i), 0); % Plot the electric field
    pause(0.001); % Pause briefly to control the animation speed
end
