#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY9hˣ  �_�>�������|���  D  � P P��J� �QMzF �  =F����1 �4�� b2�`���4 d ɦ�@�d �@4i� h �M42 �� � b�M @I	�B1z��5<i5SL� �2��(>(��g�5mޝ@D%\��"�i�X�8FO�s���oҕ�E�^_��U�(�0��(Ԧ��1��qb+�)<��;���<1���B�G�n�v���l���rX�۱�e��i��(:ys1��*�����D�<^��ǹ�g1=ZF��'�B�����X�I92Bo�It �)�9	�BԞ��Ä���P�C�@�li�"�`��1�Cg(���n�)+�0旪�%Pţ%�����<�qb˭R6�A���~M:�*��C|�^�m���k����_��*OI�z��(#�� g@��bx�7wu���t���n��%�;ݴYd6�g�"�&���=�4�d�u�MS���CF�Ll,^���ꅦ]��l;`֢�T}���r�(V(�."�!Lr:U\�lӺ�Qpf각,ּV�`{v'����h0�#= ��!]y�-�3�"�H�r����ʰ��J�T�">�9͐ Wum��5�,X�Q} -��d3�-)r��A��w�\2�Rl��H"�,�F��~��4�7��@X�hPW���zNcخ)#R<�.Ed��v�ǣ7�լ�6����={^Qw���n�	�NS~�6R��1(l��R �2���gaj/��XRʳQ�/�� �%d���(��1�w�-�N�n��T�����zO����Je�Ek�[c@����8Ef�LyY�V��e�72S���-Fc�1.2y��x0��j��7��ŗ�A�u��A�����+6���x�����AT���2�DP�Yh#xj�d�IJլy*��p^�6m28�;B��W�p(I�>,p���B� <y)��7��0�(JL��H��r��>�1���=�C�mb�Ӿ�v7���>�>� O�� ���3αA� a�.�p� rїF