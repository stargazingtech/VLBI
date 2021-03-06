% -------------------------------------------------------------------------
%
%                              jdut12ttt
%
%   Calculation of the Julan centuries of Terrestrial Time
%
%   Author: 
%       (2013-11-6)Andreas Hellerschmied
%   
%   changes       :
%           
%
%   inputs        :
%   - jdut1 :   Julian date of UT1 [d]
%   - dut1  :   dUT1 = UT1- UTC [sec]
%     
%
%   outputs       :
%    
%
%   locals        :
% 
%
%   coupling      :
%   - tai_utc   : Find the number of leap seconds between TA1 and UTC
%   
%   
%   references    :
%   - D. Vallada, 2007, Fundaments of Astrodynamics and Applications,
%     Springer, p. 197, Equ. 3-47.
%
%-------------------------------------------------------------------------

function [ttt] = jdut12ttt(jdut1, dut1)

    sec2day = 1 / (24*60*60);
    
    mjdut1 = jdut1 - 2.400000500000000e+006;
    [leap_seconds] = tai_utc(mjdut1);
    
    % utc = ut1 - dut1
    % tai = utc + leap_seconds
    % tt = tai + 32.184s
    
    jdtt = jdut1 - dut1 * sec2day + leap_seconds * sec2day + 32.184 * sec2day;

    ttt = (jdtt - 2451545) / 36525;
    
return;

