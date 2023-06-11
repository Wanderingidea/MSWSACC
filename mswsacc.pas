program mswsacc;

{$MODE DELPHI}
{$RANGECHECKS ON}
{$OPTIMIZATION ON}
{$DEBUGINFO OFF}

uses SysUtils;

(*
 * mswsacc - Middle Square Weyl Sequence pseudo random number generator accelerator
 * Generates Gigabytes of random numbers in seconds.
 * Example: mswsacc < /dev/ttyUSB0 > test.bin
 * generates random numbers until CTRL-C is pressed
 *
 * Example: mswsacc 10 < /dev/ttyUSB0 > test.bin
 * stops after 10 32 bit integers
 *
 * Cor van Wandelen 6-2023
 *
 * License:
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *)

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

var c, p, ctr, x, w, s : UInt64;
begin
    c := 0;
    ctr := 0;
    x := 0;
    w := 0;
    s := 0;
    if ParamCount > 0 then
        p := StrToInt(paramstr(1));
    Repeat
        if ParamCount > 0 then
        begin
            if c = p then halt;
            c := c + 1;
        end;
        if ctr = 0 then
        begin
            while s = 0 do
                s := readInt64 or 1;
        end;
        x := x * x;
        w := w + s;
        x := x + w;
        x := (x >> 32) or (x << 32);
        ctr := ctr + 1;
        writeInt32(x);
    Until 0 = 1;
end.
