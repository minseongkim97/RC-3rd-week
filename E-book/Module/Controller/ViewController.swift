//
//  ViewController.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/05.
//

import UIKit

//MARK: - Data
//public var writer: [String:String] = ["민법 강의":"김준호", "꼼꼼한 재은 씨의 스위프트 실전편":"이재은", "자료구조":"천인국, 공용해, 하상호", "마지막 몰입":"짐 퀵"]
//public var bookContent: [String:String] = [
//    "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍":"""
//[첫째마당] 나만의 아이폰 앱 만들기 ? 준비 단계
//01 어떤 앱을 만들까?
//01-1 앱을 만들기 전에 고려해야 할 사항
//01-2 어떤 앱을 만들까?
//01-3 개발환경 구축에 필요한 시스템
//01-4 앱 개발을 위한 참고 사이트
//02 XCODE로 첫 번째 앱 만들기
//02-1 XCODE 설치하기
//02-2 XCODE의 템플릿 구경하기 - 프로젝트 생성
//02-3 XCODE에 적응하기
//02-4 UI 컨트롤 적용 - 버튼 추가하기
//02-5 UI 컨트롤 적용 - 웹페이지가 뜨는 웹뷰 만들기
//02-6 UI 컨트롤 적용 - 텍스트 뷰 추가하기
//02-7 UI 컨트롤 적용 - 이미지 뷰 추가하기
//02-8 IOS의 UI 컨트롤 총정리
//[개념 잡기] 오브젝티브 - C 기본기 닦기
//1. 오브젝티브 - C의 특징
//2. 오브젝티브 - C의 기본 - 클래스 이해하기
//3. 클래스 내의 다른 클래스 사용하기
//4. 이벤트 대신 받기 - DELEGATE
//5. 클래스 간 연동을 위한 규칙 선언 - @PROTOCOL
//6. 함수 포인터 구현 - @SELECTOR
//7. 변수와 배열 클래스
//[개념 잡기] 스위프트 맛보기 - HELLO WORLD!
//[둘째마당] 아이폰 앱 개발 ? 기본 편
//03 계산기 앱
//03-1 신규 프로젝트 생성하기 - SINGLE VIEW APPLICATION 템플릿
//03-2 인터페이스 빌더 이용해 화면 디자인하기
//03-3 VIEWCONTROLLER 인터페이스 구현하기
//03-4 VIEWCONTROLLER 클래스 구현하기
//04 스노우 애니메이션 앱
//04-1 신규 프로젝트 생성하기 - SINGLE VIEW APPLICATION 템플릿
//04-2 인터페이스 빌더 이용해 화면 디자인하기 - VIEW CONTROLLER
//04-3 애니메이션 화면 구현하기 - SNOWANIVIEWCONTROLLER
//04-4 앱 정보 화면 구현하기
//05 알람시계 앱
//05-1 신규 프로젝트 생성하기 - SINGLE VIEW APPLICATION 템플릿
//05-2 인터페이스 빌더 이용해 화면 디자인하기 - VIEW CONTROLLER
//05-3 디지털시계 구현하기 - MAINVIEWCONTROLLER
//05-4 아날로그시계 구현하기 - MAINVIEWCONTROLLER, MAINCLOCKVIEW
//05-5 알람 설정 화면 및 알람 기능 구현하기 - SETUPVIEWCONTROLLER
//06 스케치 앱
//06-1 신규 프로젝트 생성하기 - SINGLE VIEW APPLICATION 템플릿
//06-2 인터페이스 빌더를 이용해 스케치 화면 디자인하기 - VIEW CONTROLLER
//06-3 스케치 화면에 그리는 이미지 정보를 저장할 사용자 클래스 구현하기 - POINTDATA
//06-4 캔버스를 위한 사용자 뷰 만들기 - MAINPAINTERVIEW
//06-5 기능 버튼 이벤트 구현하기 - VIEWCONTROLLER
//06-6 설정 화면 구현하기 - PAINTERSETUPVIEWCONTROLLER 클래스
//셋째마당 아이폰 앱 개발 ? 중고급 편
//07 이미지 프로세싱 앱
//07-1 메인 화면의 인터페이스 구현하기
//07-2 IMAGEPROCESSING 생성하기
//08 녹음기 앱
//08-1 녹음기 앱에 필요한 라이브러리와 클래스
//08-2 녹음 기능 구현하기 - RECORDVIEWCONTROLLER 클래스
//08-3 오디오 레벨을 계기판으로 보여주기 - METERGAUGEVIEW 클래스
//08-4 녹음 정보 조회, 저장, 삭제하기 - RECORDDATABASE 클래스
//08-5 오디오 파일 재생하고 관리하기 - RECORDLISTVIEWCONTROLLER 클래스
//09 메신저 앱
//09-1 메신저 앱을 위한 기본 인터페이스 구현하기
//09-2 로그인 화면 구현하기 - SETUPVIEWCONTROLLER 클래스
//09-3 회원 정보 목록 관리하기 - MEMBERLISTVIEWCONTROLLER 클래스
//09-4 대화창 구현하기 - CHATVIEWCONTROLLER 클래스
//09-5 네트워크 기능 구현하기 - NETWORKCONTROLLER 클래스
//10 커버플로우 앱
//10-1 커버플로우 앱을 위한 신규 프로젝트 생성하기
//10-2 여러 장의 이미지로 커버플로우 표현하기 - MAINVIEWCONTROLLER 클래스
//10-3 커버플로우 클래스
//10-4 CARDVIEWCONTROLLER 클래스
//10-5 SHAREVIEWCONTROLLER 클래스
//11 앱스토어에 올리기
//11-1 IOS 개발자로 등록하기
//11-2 인증서와 개발 기기 등록하기
//11-3 AD HOC으로 테스트용 IPA 파일 만들고 기기에 설치하기
//11-4 내 앱을 앱스토어에 등록하기
//11-5 얼마나 팔리고 있을까? - 앱 판매 현황 보기
//11-6 앱 업데이트하기
//[참고하기] 주로 사용하는 UI 프로퍼티 및 메서드
//1. UILABEL
//2. UIBUTTON
//3. UISLIDER
//4. UIIMAGEVIEW
//5. UITEXTVIEW
//6. UIWEBVIEW
//7. UITABLEVIEW
//8. UITABELVIEWDATASOURCE
//9. UISCROLLVIEW
//""",
//    "민법 강의":"민법은 어렵다",
//    "마지막 몰입":"""
//책 한 권 읽지 못했던 그는 어떻게 세계 최고의 두뇌력을 갖게 됐을까?
//
//    UN, 하버드, 구글… 세계 1%가 극찬한 두뇌 전문가 짐 퀵이 전하는 잠재력의 놀랍고 위대한 힘!
//    6년 전 스페이스X의 일론 머스크가 더 똑똑해지고 싶다는 열망에 한 두뇌 전문가를 찾아 큰 화제가 됐다. 그 전문가는 바로 ‘짐 퀵’이었다. 그는 25년 넘게 세계 정상급의 CEO와 운동선수, 배우 등 각계각층의 성공한 사람들뿐 아니라 UN, 미국 백악관, 하버드대학교, 구글, 나이키, 자포스 등 세계적 기업과 기관, 단체에서 찾는 독보적이고 저명한 브레인 코치다. 세계적인 경제지 《포브스》에서는 “짐 퀵은 지식을 배우거나 일을 하거나 취미로 운동을 하더라도 원하는 수준 이상의 성과를 이루는 법을 알려준다”고 평했다.
//
//    짐 퀵은 나이, 배경, 교육, IQ에 상관없이 인간이라면 누구라도 뇌, 추진력, 기억력, 집중력, 습관의 한계를 넘을 수 있다고 주장한다. 이를 실현하기 위해 마인드셋, 동기부여, 방법 이 세 가지 영역을 아우르는 성공 전략을 직접 밝혀냈다. 특히 잠재력을 최대치로 끌어올릴 수 있는 짐 퀵만의 집중, 학습, 기억력, 속독, 사고 전략은 전 세계 195개국의 수억 명이 열광한 매우 효과적이고 널리 검증된 방법들로 그 핵심이 《마지막 몰입: 나를 넘어서는 힘》에 아낌없이 담겨 있다.
//
//    짐 퀵이 주목받는 이유는 단순히 성공 전략만이 아니라 그의 극적인 인생 스토리에 있다. 어렸을 때 뇌를 크게 다쳐 평범한 학교생활과 학업이 어려웠던 그는 결국 대학교 중퇴를 결심한다. 책 한 권을 다 읽기 힘들 정도로 어떤 것을 배우고 익혀도 어려움을 겪자 자신의 인생에 한계를 느끼게 된 것이다. 그랬던 그가 ‘배우는 법’을 깊이 연구하고 파고들어 빌 게이츠, 일론 머스크, 버락 오바마, 오프라 윈프리 등 세계 상위 1%가 극찬한 최고의 두뇌 전문가가 되기까지 그의 인생을 바꾼 잠재력의 힘이 무엇인지 이 책을 통해 알게 될 것이다.
//""",
//    "스위프트 프로그래밍":"""
//        문법을 넘어 프로그래밍 패러다임도 익히는 스위프트 5
//        스위프트 5의 핵심 키워드는 ‘안정화’다. ABI 안정화 덕분에 버전과 환경에 크게 영향받지 않고 더 유연하게 스위프트를 사용할 수 있게 되었다. 최신 패러다임과 다양한 언어의 기능을 흡수하여 언어 전반에 걸쳐 안정화되었다. 기존 스위프트 업데이트의 주된 목적이 새로운 기능 추가였다면, 이번 스위프트 5는 비약적으로 발전한 기능을 세세하게 보정하고 다듬었다. 그렇다고 굵직한 변화가 없는 것은 아니다. 스위프트 언어의 발전은 여전히 현재 진행형이다.
//
//        스위프트 프로그래밍 핵심 패러다임 기반으로 설명
//        스위프트에는 함수형과 프로토콜 지향 프로그래밍 기법이 포함되어 있다. 이 책은 이 두 가지 패러다임에 맞춰 스위프트로 프로그래밍하는 방법을 설명한다. 스위프트 문법과 프로그래밍 패러다임을 함께 이 해하고 싶다면 이 책은 큰 도움이 될 것이다.
//        """,
//    "자료구조":"""
//Chapter 01 자료구조와 알고리즘
//1.1 자료구조와 알고리즘
//1.2 추상 자료형
//1.3 알고리즘의 성능 분석
//■연습문제
//
//Chapter 02 순환
//2.1 순환의 소개
//2.2 거듭제곱값 계산
//2.3 피보나치 수열의 계산
//2.4 하노이탑 문제
//■연습문제
//
//Chapter 03 배열, 구조체, 포인터
//3.1 배열
//3.2 구조체
//3.3 배열의 응용: 다항식
//3.4 배열의 응용: 희소행렬
//3.5 포인터
//3.6 동적 메모리 할당
//■연습문제
//
//Chapter 04 스택
//4.1 스택이란?
//4.2 스택의 구현
//4.3 동적 배열 스택
//4.4 스택의 응용: 괄호 검사 문제
//4.5 스택의 응용: 후위 표기 수식의 계산
//4.6 스택의 응용: 미로 문제
//■연습문제
//
//Chapter 05 큐
//5.1 큐 추상 데이터 타입
//5.2 선형큐
//5.3 원형큐
//5.4 큐의 응용: 버퍼
//5.5 덱이란?
//5.6 큐의 응용: 시뮬레이션
//■연습문제
//
//Chapter 06 연결 리스트 I
//6.1 리스트 추상 데이터 타입
//6.2 배열로 구현된 리스트
//6.3 연결 리스트
//6.4 단순 연결 리스트
//6.5 단순 연결 리스트의 연산 구현
//6.6 연결 리스트의 응용: 다항식
//■연습문제
//
//Chapter 07 연결 리스트 II
//7.1 원형 연결 리스트
//7.2 원형 연결 리스트는 어디에 사용될까?
//7.3 이중 연결 리스트
//7.4 예제: mp3 재생 프로그램 만들기
//7.5 연결 리스트로 구현한 스택
//7.5 연결 리스트로 구현한 큐
//■연습문제
//
//Chapter 08 트리
//8.1 트리의 개념
//8.2 이진 트리 소개
//8.3 이진 트리의 표현
//8.4 이진 트리의 순회
//8.5 반복적 순회
//8.6 레벨 순회
//8.7 트리의 응용: 수식 트리 처리
//8.8 트리의 응용: 디렉토리 용량 계산
//8.9 이진 트리의 추가 연산
//8.10 스레드 이진 트리
//8.11 이진 탐색 트리
//8.12 이진 탐색 트리의 응용: 영어 사전
//■연습문제
//
//Chapter 09 우선순위 큐
//9.1 우선순위 큐 추상 데이터 타입
//9.2 우선순위 큐의 구현 방법
//9.3 히프
//9.4 히프의 구현
//9.5 히프 정렬
//9.6 머쉰 스케줄링
//9.7 허프만 코드
//■연습문제
//
//Chapter 10 그래프 I
//10.1 그래프란?
//10.2 그래프의 정의와 용어
//10.3 그래프의 표현 방법
//10.4 그래프의 탐색
//10.5 깊이 우선 탐색
//10.6 너비 우선 탐색
//■연습문제
//
//Chapter 11 그래프 II
//11.1 최소 비용 신장 트리
//11.2 Kruskal의 MST 알고리즘
//11.3 Prim의 MST 알고리즘
//11.4 최단 경로
//11.5 Dijkstra의 최단 경로 알고리즘
//11.6 Floyd의 최단 경로 알고리즘
//11.7 위상 정렬
//■연습문제
//
//Chapter 12 정렬
//12.1 정렬이란?
//12.2 선택 정렬
//12.3 삽입 정렬
//12.4 버블 정렬
//12.5 쉘 정렬
//12.6 합병 정렬
//12.7 퀵 정렬
//12.8 히프 정렬
//12.9 기 수정렬
//12.10 정렬 알고리즘의 비교
//12.11 정렬의 응용: 영어 사전을 위한 정렬
//■연습문제
//
//Chapter 13 탐색
//13.1 탐색이란?
//13.2 정렬되지 않은 배열에서의 탐색
//13.3 정렬된 배열에서의 탐색
//13.4 이진 탐색 트리
//13.5 AVL트리
//13.6 2-3 트리
//13.7 2-3-4 트리
//■연습문제
//
//Chapter 14 해싱
//14.1 해싱이란?
//14.2 추상 자료형 사전
//14.3 해싱의 구조
//14.4 해시함수
//14.5 개방 주소법
//14.6 체이닝
//14.7 해싱의 성능 분석
//14.8 해싱의 응용 분야
//■연습문제
//■찾아보기
//"""
//]
//public var introduceContent: [String:String] = [
//    "민법 강의":"""
//『민법강의』 는 〈한국 민법전의 연혁과 구성〉, 〈법률관계와 권리·의무〉, 〈권리의 행사와 의무의 이행〉, 〈제3자에 의한 채권침해(채권의 대외적 효력)〉, 〈수인의 채권자와 채무자〉 등을 수록하고 있는 책이다.
//""",
//    "자료구조":"""
//개정3판은 초판과 마찬가지로 학습자들이 좀 더 쉽게 자료구조를 이해할 수 있도록 하자는 것을 목표로, 특히 다음과 같은 분야에 역점을 두었다.
//입문자들이 자료구조의 개념을 좀 더 쉽게 이해할 수 있도록 원저의 순서를 변경하였다.
//기초적인 자료구조라 할 수 있는 스택과 큐를 앞부분에 배치하였다.
//""",
//    "마지막 몰입":"""
//“안 된다는 생각을 단 한 번 이겨낸 순간 모든 것이 쉽고 단순해졌다!”
//구글, 하버드, UN, 나이키… 세계 상위 1%가 열광한 최고의 성공 전략!
//UN, 하버드, 구글… 세계 1%가 극찬한 두뇌 전문가 짐 퀵이 전하는 잠재력의 놀랍고 위대한 힘!
//"""
//]

public var allBooks: [Book] = [
    Book(image: (UIImage(named: "do it")), title: "Do it! iOS 입문 개발자를 위한 아이폰 앱 프로그래밍", writer: "소영섭, 허성연", category: ["기본 책장"], introduce: """
아이폰 앱 프로그래밍 iOS 8 버전 개정판.
기존의 오브젝티브-C는 물론 새로운 개발 언어인 스위프트(Swift) 입문 내용까지, Xcode 6와 iOS 8에 맞춰 전면
업그레이드되었다.
현직 프로그래머의 앱 소스 전체를 공개하고 하나하나 해설하기 때문에 입문자도 쉽게 따라할 수 있다.
"""),
    
    Book(image: UIImage(named: "swift"), title: "스위프트 프로그래밍", writer: "야곰", category: ["FAVORITE"], introduce: """
최신 패러다임과 다양한 언어의 기능을 흡수하여 언어 전반에 걸쳐 안정화되었다.
기존 스위프트 업데이트의 주된 목적이 새로운 기능 추가였다면, 이번 스위프트 5는 비약적으로 발전한 기능을 세세하게 보정하고 다듬었다.
그렇다고 굵직한 변화가 없는 것은 아니다. 스위프트 언어의 발전은 여전히 현재 진행형이다.
""")
]
public var getLibrary: [String] = ["기본 책장", "FAVORITE"]
public var readingBooks: [Book] = []
public var viewIndex: Int = 0
public var clickedBook: String = ""

//MARK: - Public Property
var readingBooksView = ReadingBooksView.shared
var allBooksView = CustomView.shared
var introduceView = IntroduceBooksView.shared
var libraryView = LibraryView.shared
var eachLibraryView = EachLibraryView.shared
var data = Data.shared
public var categoryBook: [Book] = []
public var eachCategoryVCName: String = ""


class ViewController: UIViewController, CustomSegmentedControlDelegate, LibraryViewDelegate, AllBooksViewDelegate, ReadingBooksViewDelegate, IntroduceBooksViewDelegate  {
    
    
    //MARK: - Property
    let defaults = UserDefaults.standard
    @IBOutlet weak var viewToDisplay: UIView!
    @IBOutlet weak var numLabel: UILabel!
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let screenRatio = self.viewToDisplay.frame.height / self.viewToDisplay.frame.width
//        let allBooksView = CustomView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * screenRatio))

        

        numLabel.text = "읽고 있는 책 \(readingBooks.count)권"
        viewToDisplay.addSubview(readingBooksView)
        NSLayoutConstraint.activate([
            readingBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
            readingBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
            readingBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
            readingBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
        ])

        libraryView.delegate = self
        readingBooksView.delegate = self
        allBooksView.delegate = self
        introduceView.delegate = self
        
        let codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 110, width: self.view.frame.width, height: 50), buttonTitle: ["읽고 있는 책","책장","모든 책", "책 소개글"])
        codeSegmented.delegate = self
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: - Action
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "책 추가", message: "책 제목을 정확히 입력해주세요", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "책 제목 입력"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    allBooks.append(Book(image: UIImage(named: text) ?? UIImage(systemName: "book"), title: text, writer: data.writer[text] ?? "", category: [], introduce: data.introduceContent[text] ?? ""))
                    DispatchQueue.main.async {
                        if viewIndex == 2 || viewIndex == 3 {
                            self.numLabel.text = "보유한 책 \(allBooks.count)권"
                        }
                        allBooksView.tableView.reloadData()
                        introduceView.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }
    
    @IBAction func addLibraryButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "책장 추가", message: "책장 이름을 정확히 입력해주세요", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "책장 이름 입력"
        }
        alert.addAction(UIAlertAction(title: "취소", style: .default))
        alert.addAction(UIAlertAction(title: "추가", style: .default, handler: { _ in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    getLibrary.append(text)
                    DispatchQueue.main.async {
                        if viewIndex == 1 {
                            self.numLabel.text = "보유한 책장 \(getLibrary.count)개"
                        }
                        libraryView.tableView.reloadData()
                    }
                }
            }
        }))
        present(alert, animated: true)
    }
    

    
    //MARK: - Function
    func moveVC(to category: String) {
        eachLibraryView.tableView.reloadData()
        print(category)
        let eachLibraryvc = storyboard?.instantiateViewController(withIdentifier: "EachLibraryViewController") as! EachLibraryViewController

        eachCategoryVCName = category
        eachLibraryvc.modalPresentationStyle = .fullScreen
        present(eachLibraryvc, animated: true)
        
    }
    
    
    func moveVCFromAllBooksView(to content: Int) {

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
 
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "책 읽기", style: .default, handler: { _ in
            
        
            
            let contentvc = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            contentvc.bookTitle = allBooks[content].title
            contentvc.modalPresentationStyle = .fullScreen
            self.present(contentvc, animated: true)

            if !readingBooks.contains(where: {$0.title == allBooks[content].title}) {
                readingBooks.append(allBooks[content])
                readingBooksView.tableView.reloadData()
            }
            
    
        }))
        
        alert.addAction(UIAlertAction(title: "책장에 넣기", style: .default, handler: { _ in
            
            let libraryAlert = UIAlertController(title: "책장 선택", message: "책장을 선택해주세요", preferredStyle: .actionSheet)
            for library in getLibrary {
                libraryAlert.addAction(UIAlertAction(title: library, style: .default, handler: { _ in
                    if !allBooks[content].category.contains(library) {
                        allBooks[content].category.append(library)
                    }
                }))
            }
            libraryAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
            self.present(libraryAlert, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
            
            readingBooks.removeAll(where: {$0.title == allBooks[content].title})
            allBooks.remove(at: content)

            print(readingBooks)
            readingBooksView.tableView.reloadData()
            
        
            
            DispatchQueue.main.async {
                self.numLabel.text = "보유한 책 \(allBooks.count)권"
                allBooksView.tableView.reloadData()
            }
        }))
            
        present(alert, animated: true)

    }
    
    func moveVCFromReadingBooksView(to content: Int) {
        let contentvc = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        contentvc.bookTitle = readingBooks[content].title
        contentvc.modalPresentationStyle = .fullScreen
        present(contentvc, animated: true)
    }
    
    func introduce(content: IndexPath) {
        print(introduceIndex)
        
        introduceView.tableView.beginUpdates()
        introduceView.tableView.reloadRows(at: introduceIndex, with: .none)
        introduceView.tableView.endUpdates()
    }
    
    
    func change(to index: Int) {
        viewIndex = index
        if index == 0 {
            print(viewIndex)
            numLabel.text = "읽고 있는 책 \(readingBooks.count)권"
            viewToDisplay.addSubview(readingBooksView)
            NSLayoutConstraint.activate([
                readingBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                readingBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                readingBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                readingBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])

            readingBooksView.tableView.reloadData()
        }
        
        else if index == 1 {
            print(viewIndex)
            numLabel.text = "보유한 책장 \(getLibrary.count)개"
            viewToDisplay.addSubview(libraryView)
            NSLayoutConstraint.activate([
                libraryView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                libraryView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                libraryView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                libraryView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])

            libraryView.tableView.reloadData()
        }
        
        else if index == 2 {
            print(viewIndex)
        
            numLabel.text = "보유한 책 \(allBooks.count)권"
           
            viewToDisplay.addSubview(allBooksView)
            allBooksView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                allBooksView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                allBooksView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                allBooksView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                allBooksView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
            ])
            
            
            allBooksView.tableView.reloadData()
        }
        
        else if index == 3 {
            print(viewIndex)
            numLabel.text = "보유한 책 \(allBooks.count)권"
            
            
             viewToDisplay.addSubview(introduceView)
            introduceView.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                introduceView.topAnchor.constraint(equalTo: viewToDisplay.topAnchor),
                introduceView.leadingAnchor.constraint(equalTo: viewToDisplay.leadingAnchor),
                introduceView.trailingAnchor.constraint(equalTo: viewToDisplay.trailingAnchor),
                introduceView.bottomAnchor.constraint(equalTo: viewToDisplay.bottomAnchor)
             ])
             
             
            introduceView.tableView.reloadData()
        }
    }
    

}
