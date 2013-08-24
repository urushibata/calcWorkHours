#!C:\usr\etc\strawberryPerl\perl\bin\perl.exe

open UPDATELOG, '<', 'c:/Windows/WindowsUpdate.log' or die "file open error:$!";

$pDate;
$pTime;

printf("Date\t\tshukkin\t\ttaikin\t\tHore\n");

while(<UPDATELOG>) {
	@field = split(/\t/, $_);
	my $date = $field[0];
	my $time = $field[1];

	if($date ne $pDate) {
		if($pDate ne '') {
			printf("\t%s\t%s\n", $pTime, $pTime - $time);
		}
		printf("%s\t%s", $date, $time);

	}
	$pDate = $date;
	$pTime = $time;
}
#last record stdout
printf("\t%s\n", $pTime);

close UPDATELOG;
