--�����ѯall
--��ѯ�б�
--��ѯ����ѧ������Ϣ
select * from ѧ��
select ѧ��,����,���� from ѧ��
--��ѯ������������Ϣ
select * from ѧ�� where �Ա�='��'
select ѧ��,����,���� from ѧ�� where �Ա�='��'
select * from ѧ�� where ����ϵ='�����' and ����=21
--��ѯ�б�����Է��ó���
select 'ѧ����Ϣ',ѧ��,����,���� from ѧ�� where �Ա�='��'

--�ۼ����� ��������
--��ѯѧУ�ж�����ѧ��
select count(*) ѧ������ from ѧ��
--count�������Լ��������������Լ������Եĸ���

--�Բ�ѯ�Ľṹ������������Զ�Ƿ�һ����ѯ��ĩβ
select * from ѧ�� order by ���� asc
select * from ѧ�� order by ���� desc
select * from ѧ�� where ����ϵ='�����' order by ���� desc
--��ѯ������20��21���ѧ����Ϣ
select * from ѧ�� where ���� between 20 and 21
--��ѯ������ͻ�еϵ��ѧ����Ϣ
select * from ѧ�� where ����ϵ='�����'
or ����ϵ='����'
--��ѯ�༶��ϢΪ�յ�ѧ����Ϣ
select * from ѧ�� where �༶ is not null

--like ģ����ѯ���÷�
--��ѯ���ŵ�ѧ����Ϣ
select * from ѧ�� where ���� like '��%'
select * from ѧϰ order by ѧ��,�ɼ�

--�����ѯ  Ŀ����������ͳ�ƺͷ���

--group by ��������Գ�Ϊ��������
--����ʱ����ѯ�б���Էŷ������Ժ;ۼ�����
--ͳ��ÿ��ϵ��ѧ������
select ����ϵ,count(ѧ��) ϵ���� from ѧ�� group by ����ϵ
--��ѯÿ�ſε�ѡ��������ƽ���ɼ�
select �γ̺�,count(*),avg(�ɼ�) from ѧϰ group by �γ̺� 
--��ѯÿ��ͬѧѡ�޵Ŀγ�������ƽ���ɼ���������������������
select ѧ��,count(*),avg(�ɼ�) from ѧϰ group by ѧ�� order by count(*) desc

--distinct ȥ�ص���˼
--��ѯ�ж��ٸ�ϵ
select count(distinct ����ϵ) ϵ�� from ѧ��