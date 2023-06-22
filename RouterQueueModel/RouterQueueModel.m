function [Wq_ms, max_devices] = RouterQueueModel(C_a, C_s, s, lambda_device, mu_router, plotBoolean)
%The RouterQueueModel() function provides a computational tool for the
%characterization and analysis of per-router queuing delay in the context
%of computer system design.

%   RouterQueueModel() provides a computational implementation of the
%   generalized G/G/s queuing model for use in the characterization and
%   analysis of per-router queuing delay in the context of computer system
%   design. The user supplies the required input variables (outlined
%   in the README, and the function returns a matrix which contains the average
%   queuing delay see at the router for utilization rates of [0, 100].

%Define max_devices --> Inverse of Utilization rate (Equation 2 of article)
max_devices = floor(1 / (lambda_device / (s*mu_router)));

%Define rho --> Utilization rate vector (0, 1) for the router
rho = 0:1/(max_devices-1):1;

%Define Wq --> Router Queuing Delay in seconds
Wq = zeros(length(C_a),max_devices);

%Define Wq_ms --> Router Queuing Delay in milliseconds
Wq_ms = zeros(length(C_a),max_devices);

%Calculate Queuing Delay (Wq and Wq_ms) data values for the router
for i = 1:length(C_a)

    %Define V --> VUT variability term
    V = (C_a(i)^2 + C_s^2) / 2;

    %Define U --> VUT Utilization term
    U = (rho.^(sqrt(2*(s+1))-1)) ./ ((1-rho).*s);

    %Define T --> VUT Time term
    T = 1 / mu_router;

    %Calculate Queuing Delay in seconds
    Wq(i,:) = (V * T) .* U;

    %Calculate Queuing Delay in milliseconds
    Wq_ms(i,:) = ((V * T) .* U) * 10^3;

end

%Create Figure: Utilization % vs. Queuing Delay
if plotBoolean == 1

    %Output figure with utilization vs. queuing delay for all C_a values
    figure; hold on

    rho_percentage = rho*100;

    for i = 1:length(C_a)

        legend_text = ['C_a = ', num2str(C_a(i))];
        plot(rho_percentage, Wq_ms(i,:), 'LineWidth', 1.25, 'DisplayName', legend_text);

    end

    legend_text = ['Max. Devices = ', num2str(max_devices)];
    plot(nan, nan, 'color', 'w', 'DisplayName', legend_text);

    title("Single Router: Utilization vs. Queuing Delay")
    xlabel("Utilization (Unit: Percentage)")
    xlim([0, 101])
    ylabel("Queuing Delay (Unit: Milliseconds)")
    legend('Location', 'northwest')

    hold off

else

    %Do nothing; return to main script
    return

end
