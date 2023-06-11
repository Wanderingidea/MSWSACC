program mswsacc;

{$MODE DELPHI}
{$RANGECHECKS ON}
{$OPTIMIZATION ON}
{$DEBUGINFO OFF}

function readInt64 : UInt64;
var m : UInt64;
	bron : array[0..7] of Char;
	n : integer;
begin
	for n := 0 to 7 do
		if not EOF(input) then read(bron[n]) else halt;
	m := 0;
	move(bron[0], m, SizeOf(m));
	readInt64 := m;
end;

procedure writeInt32(i : UInt64);
begin
	write(chr(byte(i)));
	write(chr(byte(i shr 8)));
	write(chr(byte(i shr 16)));
	write(chr(byte(i shr 24)));
end;

var ctr, x, w, s : UInt64;
begin
    ctr := 0;
    x := 0;
    w := 0;
    s := 0;
    Repeat
        if ctr = 0 then
        begin
            while s = 0 do
                s := readInt64;
            s := s or 1;
        end;
        x := x * x;
        w := w + s;
        x := x + w;
        x := (x >> 32) or (x << 32);
        ctr := ctr + 1;
        writeInt32(x);
    Until 0 = 1;
end.
