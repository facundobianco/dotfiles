% muttrc-mode for jed - Dave Pearson <davep@davep.org>
% ----------------------------------------------------
%
% This is a simple highlighting scheme for your ~/.muttrc file. It does
% nothing fancy. I "borrowed" it from sh_mode.
%
% To use it, add the following to your ~/.jedrc:
%
% autoload( "muttrc_mode", "muttrc" );
%
% and then place the string '-*- muttrc -*-' in a comment on the file
% line of any mutt rc files.
%
% This code is offered freely, for anyone to do with as they wish. However,
% I would appreciate receiving any handy changes you make.
%
% $Log: muttrc.sl,v $
% Revision 1.13  2000/06/16 13:19:09  davep
% Updated keywords to keep in sync with mutt 1.3.x.
% Thanks to Byrial Jensen <byrial@image.dk> for providing the list.
%
% Revision 1.12  1999/03/14 08:29:09  davep
% Included changes from Thomas Roessler <roessler@guug.de>. He
% added pgp-hook, alternative_order and fcc-save-hook.
%
% Revision 1.11  1998/10/14 15:43:48  davep
% Added contact details to the header ready for submission to
% the mutt contrib directory.
%
% Revision 1.10  1998/10/14 15:39:12  davep
% Added 'score' and 'send-hook'
%
% Revision 1.9  1997/10/24 11:31:45  davep
% 'alternates' is no longer a command.
%
% Revision 1.8  1997/10/23 08:43:29  davep
% fcc-hook was missing
%
% Revision 1.7  1997/09/19 18:23:40  davep
% Added 'push' and 'hdr_order'.
%
% Revision 1.6  1997/07/19 06:28:55  davep
% For some reason 'send-hook' was missing.
%
% Revision 1.5  1997/06/05 06:14:46  davep
% Added the auto_view keyword.
%
% Revision 1.4  1997/04/30 21:19:15  davep
% Removed 'sort' as this is no longer a keyword.
%
% Revision 1.3  1997/03/23 16:56:40  davep
% "mono" was missing.
%
% Revision 1.2  1997/02/13 12:33:18  davep
% Added the 'mailboxes' keyword
%
% Revision 1.1  1997/01/22 10:44:18  davep
% Initial revision
%

$1 = "MUTTRC";

create_syntax_table( $1 );
define_syntax( "#", "", '%', $1 );
define_syntax( "([{", ")]}", '(', $1 );
define_syntax( '"', '"', $1 );
define_syntax( '\'', '\'', $1 );
define_syntax( '\\', '\\', $1 );
define_syntax( "-0-9a-zA-Z_", 'w', $1 );        % words
define_syntax( "-+0-9", '0', $1 );              % Numbers
define_syntax( ",;:", ',', $1 );
define_syntax( "%-+/&*=<>|!~^", '+', $1 );

() = define_keywords( $1, "set", 3 );
() = define_keywords( $1, "bindexecmonopush", 4 );
() = define_keywords( $1, "aliascolorlistsmacroresetscoreunset", 5 );
() = define_keywords( $1, "ignoremy_hdrsourcetoggleunhookunmono", 6 );
() = define_keywords( $1, "unaliasuncolorunlistsunscore", 7 );
() = define_keywords( $1, "fcc-hookpgp-hookunignoreunmy_hdr", 8 );
() = define_keywords( $1, "auto_viewhdr_ordermailboxesmbox-hooksave-hooksend-hooksubscribe", 9 );
() = define_keywords( $1, "folder-hookunhdr_orderunsubscribe", 11 );
() = define_keywords( $1, "charset-hookdisplay-hook", 12 );
() = define_keywords( $1, "fcc-save-hook", 13 );
() = define_keywords( $1, "alternative_order", 17);

define muttrc_mode()
{
   set_mode( "MUTTRC", 0 );
   use_syntax_table( "MUTTRC" );
   runhooks( "muttrc_mode_hook" );
}
