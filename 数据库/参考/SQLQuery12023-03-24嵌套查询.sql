--Ƕ�ײ�ѯ
--ʹ�ñȽ������ some all

--��ѯ�ȼ����ϵ����ѧ��������ѧ����Ϣ
--����ѯû�����Ӳ�ѯ���ݲ�����Ƕ�ײ�ѯ��Ϊ����ز�ѯ
select * from ѧ�� where ����>all
(select ���� from ѧ�� where ����ϵ='�����')
select * from ѧ�� where ����>
(select max(����) from ѧ�� where ����ϵ='�����')

--��ѯ������ͬѧ������ѧ����Ϣ

select * from ѧ�� where ����>
(select ���� from ѧ�� where ����='����')

----��ѯ�ȼ����ϵһЩѧ��������ѧ����Ϣ
select * from ѧ�� where ����>some
(select ���� from ѧ�� where ����ϵ='�����')
----��ѯ�ȼ����ϵһЩѧ�������ķǼ����ϵѧ����Ϣ
select * from ѧ�� where ����ϵ<>'�����' and ����>some
(select ���� from ѧ�� where ����ϵ='�����')
select * from ѧ�� where ����ϵ<>'�����' and ����>
(select min(����) from ѧ�� where ����ϵ='�����')
----��ѯ������ϵһЩѧ��ͬ��Ǽ����ϵѧ����Ϣ
select * from ѧ�� where ����ϵ<>'�����' and ����=some
(select ���� from ѧ�� where ����ϵ='�����')


--ʹ��ν��in��Ƕ�ײ�ѯ  Ҳ�ǲ���ز�ѯ  ��Ա�ʸ��ж�
--��ѯѡ����c001�γ̵�ѧ��ѧ�ź�����
select ѧ��,���� from ѧ�� where ѧ�� in
(select ѧ�� from ѡ�� where �γ̺�='c001')

select ѧ��,���� from ѧ�� where ѧ�� =some
(select ѧ�� from ѡ�� where �γ̺�='c001')
select ѧ��.ѧ��,���� from ѧ��,ѡ�� 
where ѧ��.ѧ��=ѡ��.ѧ�� and �γ̺�='c001'
--in ��=some�ȼ�
--��ѯ����ͬѧѡ�޵Ŀγ̺źͳɼ�
 select �γ̺�,�ɼ� from ѡ�� where ѧ�� in
(select ѧ�� from ѧ�� where ����='����')
--��ѯ����ͬѧѡ�޵Ŀγ̺š��γ����ͳɼ�
select ѡ��.�γ̺�,�γ���,�ɼ� from ѡ��,�γ� 
where ѡ��.�γ̺�=�γ�.�γ̺� and ѧ�� in
(select ѧ�� from ѧ�� where ����='����')

--ʹ��ν��exists���÷�����صĲ�ѯ��ʹ��in�Ĳ�ѯ
--�� ����ת����ʹ��exists�Ĳ�ѯ,
--�Ӳ�ѯ����true or false
--��ѯ����ͬѧѡ�޵Ŀγ̺źͳɼ�
 select �γ̺�,�ɼ� from ѡ�� where exists
(select * from ѧ�� where ѧ��=ѡ��.ѧ�� and ����='����')

--��ѯѡ��������ʦ�γ̵�ѧ��ѧ�š��γ̺źͳɼ�
select ѧ��,�γ̺�,�ɼ� from ѡ�� where exists
(select * from �γ� where �γ̺�=ѡ��.�γ̺�
and �ον�ʦ='����ʦ')

select ѧ�� from ѡ�� group by ѧ��
having count(ѧ��)=(select count(*) from �γ�)

--��ѯc001�γ̳ɼ��������ߵ�ѧ��ѧ�źͳɼ�

--��ѯѡ�������ݿ�ԭ���ѧ��ѧ�źͳɼ�
--��ѯѡ�������ݿ�ԭ���ѧ��ѧ�š�����
--��ѯ�����ϵѧ����ѡ�޵Ŀγ̿γ̺�

--���ϲ�ѯ union intersect except
--��ѯѡ����C001����c002�γ̵�ѧ��ѧ��
select ѧ�� from ѡ�� where �γ̺�='c001'
union
select ѧ�� from ѡ�� where �γ̺�='c002'
--��ѯѡ����C001��c002�γ̵�ѧ��ѧ��
select ѧ�� from ѡ�� where �γ̺�='c001'
intersect
select ѧ�� from ѡ�� where �γ̺�='c002'
--��ѯѡ����C001������û��ѡ��c002�γ̵�ѧ��ѧ��
select ѧ�� from ѡ�� where �γ̺�='c001'
except
select ѧ�� from ѡ�� where �γ̺�='c002'
--��ѯѡ����C001������û��ѡ��c002�γ̵�ѧ��ѧ�ź�����

select ѧ��,���� from ѧ�� where ѧ�� in
(select ѧ�� from ѡ�� where �γ̺�='c001')
select ѧ��,���� from ѧ�� where ѧ�� =some
(select ѧ�� from ѡ�� where �γ̺�='c001')
select ѧ��,���� from ѧ�� where exists
(select * from ѡ�� where ѧ��=ѧ��.ѧ�� and �γ̺�='c001')
except
select ѧ��,���� from ѧ�� where exists
(select * from ѡ�� where ѧ��=ѧ��.ѧ�� and �γ̺�='c002')

--��ѯû��ѡ������ʦ���̿γ̵�ѧ��ѧ��

--��ѯѡ��������ʦ���̿γ̵�ѧ��ѧ�ź�����

select ѧ�� from ѧ��
except
select ѧ�� from ѡ��,�γ� where ѡ��.�γ̺�=�γ�.�γ̺� and �ον�ʦ='����ʦ'

==not in=except
--in = =some 
--not in=<>some �ȼ���
select ѧ�� from ѧ�� where ѧ�� not in
(select ѧ�� from ѡ��,�γ� where ѡ��.�γ̺�=�γ�.�γ̺� and �ον�ʦ='����ʦ')

--��ѯû��ѡ������ʦ���̿γ̵�ѧ��ѧ�ź�����
select ѧ��,���� from ѧ��
except
select ѧ��,���� from ѧ�� where ѧ�� in 
(select ѧ�� from ѡ�� where �γ̺� in
(select �γ̺� from �γ� where �ον�ʦ<>'����ʦ'))

select distinct ѧ�� from ѡ��,�γ� where ѡ��.�γ̺�=�γ�.�γ̺� and �ον�ʦ<>'����ʦ'
--��ɾ��
insert into ѡ�� values('20210004','c001',90)
--ɾ���ɼ�Ϊ�յ�ѡ�μ�¼
delete from ѡ�� where �ɼ� is null
--ɾ������ʦ���̿γ̵�ѡ�μ�¼
delete from ѡ�� where �γ̺� in
(select �γ̺� from �γ� where �ον�ʦ='����ʦ')

--��c001�γ̵ĳɼ�ȫ����10��

update ѡ�� set �ɼ�=�ɼ�-10 where �γ̺�='c001'
update ѡ�� set �ɼ�=�ɼ�-10 where �γ̺� in
(select �γ̺� from �γ� where �ον�ʦ='����ʦ')

--��ѯ�����ϵ����������

--��ѯ����ͬѧ�Ļ�����Ϣ

--��ѯÿ��ϵ������

--��ѯÿ��ϵ��������������������������

--��ѯÿ��ϵ��������Ů������  group by ����ϵ,�Ա�
select ����ϵ,�Ա�,count(*) from ѧ�� group by ����ϵ,�Ա�

--��ѯ�������޿γ̵Ŀγ̺źͳɼ������ӡ�Ƕ�׽Կɣ�
select �γ̺�,�ɼ� from ѡ�� where ѧ��=
(select ѧ�� from ѧ�� where ����='����')
--��ѯ�������޿γ̵Ŀγ̺š��γ������ον�ʦ�����ӡ�Ƕ������д�����֣�
select �γ̺�,�γ���,�ον�ʦ from �γ� where �γ̺� in
(select �γ̺� from ѡ�� where ѧ�� =
(select ѧ�� from ѧ�� where ����='����'))
--��ѯ������ѧ��ѡ�޿γ̵Ŀγ̺źͿγ���

--������д���Ϊ���γ̣��̣� ѧ���������� ѡ�Σ���������
--����select ����where not exists �������������

--��c002�γ̣���������60�ֵĳɼ���20�֣��������

--�����ݿ�ԭ��γ̣���������60�ֵĳɼ���20��
update ѡ�� set �ɼ�=�ɼ�+20 where �ɼ�<60 and 
�γ̺� in (select �γ̺� from �γ� where �γ���='���ݿ�')

