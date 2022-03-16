/**
 * 
 */

const slides = document.querySelector('.slides'); //��ü �����̵� �����̳�
const slideImg = document.querySelectorAll('.slides li'); //��� �����̵��
let currentIdx = 0; //���� �����̵� index 
const slideCount = slideImg.length; // �����̵� ����
const prev = document.querySelector('.prev'); //���� ��ư
const next = document.querySelector('.next'); //���� ��ư
const slideWidth = document.querySelector('.slides li').style.width; //�Ѱ��� �����̵� ����
const slideMargin = 10; //�����̵尣�� margin �� 

//��ü �����̵� �����̳� ���� ����
function moveSlide(num)
{
	slides.style.left = -num * 160 + 'px';
	currentIdx = num;
}

prev.addEventListener('click', function () {
	/*
	 * ù ��° �����̵�� ǥ�� �������� ���� ��ư ������ �ƹ��� ���� ���� �ϱ� ����
	 * currentIdx !==0�϶��� moveSlide �Լ� �ҷ���
	 */
	if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener('click', function () {
	/*
	 * ������ �����̵�� ǥ�� �������� ���� ��ư ������ �ƹ��� ���� ���� �ϱ� ����
	 * currentIdx !==slideCount - 1 �϶��� moveSlide �Լ� �ҷ���
	 */
	if (currentIdx !== slideCount - 4)
	{
		moveSlide(currentIdx + 1);
	}
});