#! logout Control-D
setopt ignore_eof
#setopt no_ignore_eof

#! file over write
setopt no_clobber

#! command correct
setopt correct
#setopt correct_all

#! extended command completion
setopt extended_history

#setopt append_history
#setopt inc_append_history
setopt share_history

# ���ޥ�ɹԤ���ҥ��ȥ�ꥹ�Ȥ��ɲä��줿��Τ��Ť���Τ�����Ʊ�����
# �ˡ��Ť���Τ�ꥹ�Ȥ���������(���줬ľ���Υ��٥�ȤǤʤ��Ƥ�)��
#setopt hist_ignore_all_dups
# �ҥ��ȥ�ե�����˽񤭽Ф��Ȥ��ˡ��Ť����ޥ�ɤ�Ʊ����Τ�̵�뤹�롣
setopt hist_save_nodups
#setopt hist_ignore_dups

#setopt hist_reduce_blanks

#setopt hist_no_store

setopt hist_ignore_space

# Local variables:
# mode: sh
# coding: euc-jp
# End:
