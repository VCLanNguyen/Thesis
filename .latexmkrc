# This ensures buffer flushing, which makes output better in vimtex
STDOUT->autoflush;
STDERR->autoflush;

push @generated_exts, "nlo";
push @generated_exts, "nls";
# ....
push @generated_exts, "glo";
push @generated_exts, "gls";
push @generated_exts, "glg";

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
  system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg" );
}

add_cus_dep('glo', 'gls', 0, 'glo2gls');
sub glo2gls {
  system("makeindex $_[0].glo -s $_[0].ist -o $_[0].gls -t $_[0].glg" );
}
