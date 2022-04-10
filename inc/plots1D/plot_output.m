function plot_output(t_span, y, y_hat)
    figure;
    plot(t_span, y, 'Linewidth', 1);
    hold on;
    plot(t_span, y_hat, 'Linewidth', 1);
    legend({'$y$', '$\hat{y}$'}, 'Interpreter', 'latex');
    xlabel('$t(s)$', 'interpreter', 'latex', 'FontWeight', 'bold');
    ylabel('system & model output');
end

