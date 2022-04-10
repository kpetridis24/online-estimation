function plot_estimations(t_span, param1, param2, target1, target2)
    figure;
    plot(t_span, param1, 'Linewidth', 1);
    hold on;
    plot(t_span, param2, 'Linewidth', 1);
    hold on;
    
    line([t_span(1), t_span(length(t_span))], [target1, target1], ...
        'Color', 'magenta', 'LineStyle','--', 'Linewidth', 1);
    hold on;
    line([t_span(1), t_span(length(t_span))], [target2, target2], ...
        'Color', 'green', 'LineStyle','--', 'Linewidth', 1);
    
    legend({'$\hat{a}$', '$\hat{b}$', '$a$', '$b$'}, 'Interpreter', 'latex');
    xlabel('$t(s)$', 'interpreter', 'latex', 'FontWeight', 'bold');
    ylabel('estimated parameters');
end

