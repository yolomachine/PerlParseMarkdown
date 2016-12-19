use v5.24;
use List::Util 'reduce';
open STDIN, 'markdown.md' or die $!;
open STDOUT, '>test.html' or die $!; 

my %links = ();
my @regexs = (
	{ 
		to_find => qr/(?:^|\s+)(?<!\\)\[(.+)(?<!\\)\](?<!\\): (.+)$/m, 
		replacement => sub { $links{"[$1]"} = "($2)"; "" }
	},	
	{ 
		to_find => qr/(?<!\\\!)((?<!\\)\[(?:.+?)(?<!\\)\])(?<!\\)\[(.+?)(?<!\\)\]/, 
		replacement => sub { $links{"[$2]"} eq undef ? $1 . "[$2]" : $1 . $links{"[$2]"} }
	},	
	{ 
		to_find => qr/((?<!\\)\-){3}/, 
		replacement => sub { "<hr>" }
	},
	{ 
		to_find => qr/^(?:(?<!\\)>)((.+\n)+)$/m, 
		replacement => sub { "<blockquote>\n$1</blockquote>\n" }
	},
	{ 
		to_find => qr/(?:(?<!\\)`){3}\n((.+\n?)+)\n(?:(?<!\\)`){3}/, 
		replacement => sub { "<pre>\n<code>\n$1\n</code>\n</pre>" }
	},
	{ 
		to_find => qr/(?:(?<!\\)~){2}(.+?)(?:(?<!\\)~){2}/, 
		replacement => sub { "<s>$1</s>" }
	},
	{ 
		to_find => qr/(?:(?<!\\)`)((.+\n?)+)(?:(?<!\\)`)/, 
		replacement => sub { "<code> $1 </code>" }
	},
	{ 
		to_find => qr/((?<!\\)#{1,6})(.+)/,
		replacement => sub { my $len = length $1; "<h$len>$2 </h$len>" } 
	},
	{ 
		to_find => qr/\\<(.+?)>/m, 
		replacement => sub { " \\<\\$1> " } 
	},
	{ 
		to_find => qr/[^!](?<!\\)\[(.+?)(?<!\\)\]\(((?:https?\:\/\/\.)?(?:www\.)*?(.+?\..+?))\)/, 
		replacement => sub { " <a href = \"$2\">$1</a> " } 
	},
	{ 
		to_find => qr/(?<!\\)<((?:https?\:\/\/)(?:www\.)?(.+?\..+?))(?<!\\)>/, 
		replacement => sub { " <a href = \"$1\">$1</a> " } 
	},
	{ 
		to_find => qr/\!\[(.+?)\]\(((?:https?\:\/\/\.)?(?:www\.)?(.+?\..+?))\)/, 
		replacement => sub { "<img src = \"$2\">" } 
	},
	{ 
		to_find => qr/(?:(?:(?<!\\)_){2}(.+?)(?:(?<!\\)_){2})|(?:(?:(?<!\\)\*){2}(.+?)(?:(?<!\\)\*){2})/, 
		replacement => sub { "<strong> " . ($1 // $2) . " <\/strong>" } 
	},
	{ 
		to_find => qr/(?:(?:(?<!\\)_)(.+?)(?:(?<!\\)_))|(?:(?:(?<!\\)\*)(.+?)(?:(?<!\\)\*))/, 
		replacement => sub { "<em> " . ($1 // $2) . " <\/em>" } 
	},
	{ 
		to_find => qr/(^\n(?!<\/?.+>|[*\-+`>]|\d\.)(.+\n)+$)/m, 
		replacement => sub { (my $tmp = $1) =~ s/(?!^[\n])(?:[\n])/\n<br>\n/mg; "\n<p>$tmp</p>\n" }
	},
	{ 
		to_find => qr/^((?:(?<!\\)\d\. )|(?:(?<!\\)[*\-+] ))((?:.+\n)+)$/m, 
		replacement => sub 
		{ 
			my $tmp = reduce { $a . $b } do { (my $tmp = $2) =~ s/(?:^\d\. )|(?:[*\-+] )//mg; chomp $tmp; map { "<li> " . $_ . " </li>\n" } split '\n', $tmp }; 
			my $tag = ($1 !~ /\d\. /) ? "ul" : "ol"; 
			"<$tag>\n$tmp</$tag>\n" 
		}
	}
);

my $text = do { local $/; <> };

say "<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\">\n</head>";
$text =~ s/$_->{to_find}/$_->{replacement}->()/eg for @regexs;
say "\n<body>\n$text\n</body>\n</html>";