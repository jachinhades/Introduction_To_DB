--�����ѯall
--��ѯ�б�
--��ѯ����ѧ������Ϣ
select * from ѧ��
select ѧ��,����,���� from ѧ��
--��ѯ������������Ϣ
select * from ѧ�� where �Ա�='��'
select ѧ��,����,���� from ѧ�� where �Ա�='��'
select * from ѧ�� where �Ա�='��' and ����=19
--��ѯ�б�������Է��ó���
select 'ѧ����Ϣ',ѧ��,����,���� from ѧ�� where �Ա�='��'

--�ۼ�����   ��������
--��ѯѧУ�ж�����ѧ��
select count(*) ѧ������ from ѧ��
--count�������Լ��������������Լ������Եĸ���
select count(ѧ��) ѧ������,avg(����) ѧ��ƽ������,
max(����),min(����) from ѧ��
select avg(����) ѧ��ƽ������ from ѧ��

--�Բ�ѯ�Ľ��������������Զ�Ƿ���һ����ѯ��ĩβ
select * from ѧ�� order by ���� asc
select * from ѧ�� order by ���� desc
select * from ѧ�� where ����ϵ='�����'
order by ���� desc
--��ѯ������20��21���ѧ����Ϣ
select * from ѧ�� where ���� between 20 and 21
--��ѯ������ͻ�еϵ��ѧ����Ϣ
select * from ѧ�� where ����ϵ='�����'
or ����ϵ='��е'

select * from ѧ�� where ����ϵ in('�����','��е')
--��ѯ�༶��ϢΪ�յ�ѧ����Ϣ
select * from ѧ�� where �༶ is not null

--like ģ����ѯ���÷�
--��ѯ���ŵ�ѧ����Ϣ
select * from ѧ�� where ���� like '��%'
select * from ѡ�� order by ѧ��,�ɼ�

--�����ѯ  Ŀ����������ͳ�ƺͷ���

--group by ��������Գ�Ϊ��������
--����ʱ����ѯ�б���Էŷ������Ժ;ۼ�����
--ͳ��ÿ��ϵ��ѧ������
select ����ϵ,count(ѧ��) ϵ���� from ѧ�� group by ����ϵ
--��ѯÿ�ſε�ѡ��������ƽ���ɼ�
select �γ̺�,count(*),avg(�ɼ�) from ѡ�� group by �γ̺� 
-����֮�󣬼���ɸѡ��β�����
select �γ̺�,count(*),avg(�ɼ�) from ѡ�� group by �γ̺� 
having avg(�ɼ�)>=90 order by avg(�ɼ�)

--��ѯÿ��ͬѧѡ�޵Ŀγ�������ƽ���ɼ�
select ѧ��,count(*),avg(�ɼ�) from ѡ�� group by ѧ��
--��ѯÿ��ͬѧѡ�޵Ŀγ�������ƽ���ɼ���������������������
select ѧ��,count(*),avg(�ɼ�) from ѡ�� group by ѧ��
order by count(*) desc
--��ѯѡ����������2�ŵ�ͬѧѧ�ź�ƽ���ɼ���������������������
select ѧ��,count(*),avg(�ɼ�) from ѡ�� group by ѧ��
having count(*)>=2 order by count(*) desc

--distinct ȥ�ص���˼
--��ѯ�ж��ٸ�ϵ
select count(distinct ����ϵ) from ѧ��







