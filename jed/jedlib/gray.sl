% fg          | bg
$1 = "default"; $2 = "default";

% set_color("which", fg, bg);

set_color("normal", $1, $2);                % default fg/bg
set_color("status", "black", "gray");       % status or mode line
set_color("operator", "brightmagenta", $2); % +, -, ...
set_color("number", "brightgreen", $2);     % 10, 2.71, ...
set_color("comment", "gray", $2);           % /* comment */
set_color("region", "black", "yellow");     % for marking regions
set_color("string", "cyan", $2);            % "string" or 'char'
set_color("keyword", "brightred", $2);      % if, while, unsigned, ...
set_color("keyword1", "red", $2);           % malloc, exit, ...
set_color("delimiter", "brightgreen", $2);  % {}[](),.; ...
set_color("preprocess", "magenta", $2);     % #ifdef ...
set_color("message", "gray", $2);
set_color("error", "gray", $2);
set_color("dollar", "brightred", $2);       % color dollar sign continuat $
set_color("...", "red", $2);                % folding indicator

set_color ("menu_char", "yellow", "gray");
set_color ("menu", "black", "gray");
set_color ("menu_popup", "black", "gray");
set_color ("menu_shadow", "blue", "black");
set_color ("menu_selection", "green", "gray");
set_color ("menu_selection_char", "yellow", "gray");

set_color ("cursor", "black", "green");
set_color ("cursorovr", "black", "green");

set_color ("quote", "white", $2);

%% The following have been automatically generated:
set_color("linenum", "black", "gray");
set_color("trailing_whitespace", "black", "gray");
set_color("tab", "black", "gray");
set_color("url", "brightblue", $2);
set_color("italic", $1, $2);
set_color("underline", "brightblue", $2);
set_color("bold", "brightred", $2);
set_color("html", "magenta", $2);
set_color("keyword2", "green", $2);
set_color("keyword3", "white", $2);
set_color("keyword4", $1, $2);
set_color("keyword5", $1, $2);
set_color("keyword6", $1, $2);
set_color("keyword7", $1, $2);
set_color("keyword8", $1, $2);
set_color("keyword9", $1, $2);
