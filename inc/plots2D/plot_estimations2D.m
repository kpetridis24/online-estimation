function plot_estimations2D(t_span, a11, a12, a21, a22, ta11, ...
                                            ta12, ta21, ta22)
    figure;
    plot(t_span, a11, 'Linewidth', 1);
    hold on;
    plot(t_span, a12, 'Linewidth', 1);
    hold on;
    plot(t_span, a21, 'Linewidth', 1);
    hold on;
    plot(t_span, a22, 'Linewidth', 1);
    hold on;
    
    line([t_span(1), t_span(length(t_span))], [ta11, ta11], ...
        'Color', 'magenta', 'LineStyle','--', 'Linewidth', 1);
    hold on;
    line([t_span(1), t_span(length(t_span))], [ta12, ta12], ...
        'Color', 'green', 'LineStyle','--', 'Linewidth', 1);
    hold on;
    line([t_span(1), t_span(length(t_span))], [ta21, ta21], ...
        'Color', 'magenta', 'LineStyle','--', 'Linewidth', 1);
    hold on;
    line([t_span(1), t_span(length(t_span))], [ta22, ta22], ...
        'Color', 'green', 'LineStyle','--', 'Linewidth', 1);
    
    legend({'$\hat{a}$', '$\hat{b}$', '$a$', '$b$'}, 'Interpreter', 'latex');
    xlabel('$t(s)$', 'interpreter', 'latex', 'FontWeight', 'bold');
    ylabel('estimated parameters');
end

