var qdata = `#수업시간에 메모한 시험범위를 잃어버렸다! 당신은
E같이 수업을 듣는 친구들에게 물어본다
I학교페이지에 들어가 시험범위를 찾아본다
#친구들과 술자리에서 나는
I들어주면서 리액션 많이하는 타입
E내가 먼저 화제를 꺼내는 타입
#갑자기 생긴 휴일의 당신은
I하루종일 누워서 유튜브를 본다
E일단 그날 시간 되는 친구가 있는지 물어본다
#여행 계획을 세운다면
S시간, 장소 단위로 최대한 자세히 세운다
N그날 뭐할지 정도만 정해둔다
#나는 다른사람보다
S성실하고 꼼꼼하다
N창의적이고 유연하다
#처음 해보는 일을 할 때
S다른 사람들이 어떻게 하는지 참고한다
N일단 부딛혀보고 내 방식대로 한다
#일을 하다가 작지만 아리송한 부분이 생겼을 때
J시간이 걸려도 도움을 청한다
P일단 할 수 있는 대로 하고 넘어간다
#늦은 시간,영화 한편만 보고 자려했는데 잠이 안온다. 나는
P한편 더 보고 자면 된다.
J그래도 내일 일정이 있으니 억지로라도 자야한다.
#나는 일을 할 때
J나만의 계획을 세우고 그대로 실행한다.
P일단 눈 앞에 보이는 일 먼저 처리한다.
#드라마나 소설을 볼 때
T일어난 사건들을 중심으로 본다
F내가 인물에게 몰입해 공감하며 본다
#갑자기 친구가 다른 친구와 생긴 문제를 이야기한다. 우선
T어쩌다 문제가 생겼는지 알아낸다
F친구의 기분을 먼저 풀어준다
#고급 레스토랑에서 맛있는 음식을 먹고난 뒤
T아무리 맛있어도 비싸서 별로인 것같다
F좀 비싸도 맛있으니까 만족이다`;

var rdata = `-남을 가르치거나 영감을 주는 일에 큰 보람을 느껴요. 하지만 문제를 해결해주고자 하는 마음이 커서 오지랖을 부릴때가 많아요.
-감수성이 풍부하고 긍정적이지만 해야할 말은 하는 스타일이에요.
-의외로 감정적인 면이 있어 기분 변화가 큰 편이에요.
-카리스마 있고 진실된 이야기를 하는 모습의 리더 기질을 가지고 있어요.
-해결하지 못할 문제도 해결하려 하고 거절을 잘 못하는 성격때문에 힘들어질 때가 많아요.
-많은 사람들과 두루두루 친해지는 것을 좋아하며 관계를 유지하기위해 꾸준히 노력해요.`;

var hdata = `ENTJ#ISFP#ISFJ
ENTP#ISFJ#ISFP
INTJ#ESFP#ESFJ
INTP#ESFJ#ESFP
ESTJ#INFP#INFJ
ESFJ#INTP#INTJ
ISTJ#ENFP#ENFJ
ISFJ#ENTP#ENTJ
ENFJ#ISTP#ISTJ
ENFP#ISTJ#ISTP
INFJ#ESTP#ESTJ
INFP#ESTJ#ESTP
ESTP#INFJ#INFP
ESFP#INTJ#INTP
ISTP#ENFJ#ENFP
ISFP#ENTJ#ENTP`;

var pdata =  `ENFJ#미래를 보는 자#술을 마시면 취기가 24시간 뒤에 오는 능력
ENFP#독심술#다른 사람 인중에 검지손가락을 대면 생각을 읽을 수 있는 능력
ENTJ#찍먹이 진리#무엇이든 부먹을 해도 찍먹으로 먹는 맛을 느끼는 능력
ENTP#유부초밥 소환술#하루에 유부초밥을 3개까지 생성할 수 있는 능력
ESFJ#큐피트의 화살#어느 사람이든 커플로 만들거나 깰 수 있는 능력
ESFP#유연왕#팔꿈치에 혀가 닿는 능력(양쪽 모두)
ESTJ#공감왕#'하나 둘 셋 야!'라고 하면 매우 슬픈 사람에게도 위로가 되는 능력
ESTP#혓바닥 필러#과일이나 야채를 혀로 할ㅌ으면 껍질이 벗겨짐
INFJ#바다의 보물#너구리 봉지를 까면 다시마가 무조건 2개 들어있는 능력
INFP#기억 삭제#카톡을 잘못 보냈을 때 없던 일로 만들 수 있는 능력
INTJ#요리왕#고기를 완벽하게 구울 수 있지만 본인은 못 먹는 능력
INTP#시간 이동#후첨 라면 스프를 실수로 먼저 넣어도 다시 뺄 수 있는 능력
ISFJ#공정한 심판관#나무젓가락이 무조건 완벽하게 쪼개지는 능력
ISFP#정치왕#아무리 잘못해도 다른 사람이 대신 혼나는 능력
ISTJ#모기 면역#모기한테 절대 안 물리지만 가장 가까이 있는 사람이 대신 물리는 능력
ISTP#이편한세상#책상에 엎드리면 바로 제일 편한 자세가 취해지는 능력`;


/* =============== 파일 값 가져오기 =============== */
function loadFile(filePath) {
  var rawFile = new XMLHttpRequest();
    rawFile.open("GET", "datas/"+filePath, false);
    var allText="";
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                allText = rawFile.responseText;
            }
        }
    }
    rawFile.send(null);
    return allText;
}

/* =============== url 파라미터 가져오기 =============== */
function getParameterByName(name)
{
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp(
		"[\\?&]" + name + "=([^&#]*)"),
		results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")
	);
}
 