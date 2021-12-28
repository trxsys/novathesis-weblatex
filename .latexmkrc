add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
add_cus_dep('acn', 'acr', 0, 'makeglo2gls');
add_cus_dep('slo', 'sls', 0, 'makeglo2gls');

sub makeglo2gls {
    my ($base_name, $path) = fileparse( $_[0] ); #handle -outdir param by splitting path and file, ...
    if ( $silent ) {
        system "makeglossaries -q '$base_name'"; #unix
        # system "makeglossaries", "-q", "$base_name"; #windows
    }
    else {
        system "makeglossaries '$base_name'"; #unix
        # system "makeglossaries", "$base_name"; #windows
    };
}

# sub makeglo2gls {
#     system("makeindex -s '$_[0]'.ist -t '$_[0]'.glg -o '$_[0]'.gls '$_[0]'.glo");
# }

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
push @generated_exts, 'slo', 'sls', 'slg';
$clean_ext .= ' %R.ist %R.xdy';
