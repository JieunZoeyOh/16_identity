
window.onload = function(){
    const navLeft = document.getElementById("nav_left_arrow");
    const navRight = document.getElementById("nav_right_arrow");
    navLeft.addEventListener("click", navSliders);
    navRight.addEventListener("click", navSliders);

    const mbtiLeft = document.getElementById("mbti_left");
    const mbtiRight = document.getElementById("mbti_right");
    mbtiLeft.addEventListener("click", bookSlidertoLeft);
    mbtiRight.addEventListener("click", bookSlidertoRight);

    const list = document.querySelector("#recommend_mbti_list");
    const mbtiList = list.children;
    for(var i=0; i<mbtiList.length; i++){
        mbtiList[i].classList.add(i);
        mbtiList[i].addEventListener("click", buttonMove);
    }
    
    /*header js 부분*/
    const mypageMenu = document.querySelector("#mypageMenu");
    const mypageMenuList = mypageMenu.children;
    for(var i=0; i<mypageMenuList.length; i++){
        mypageMenuList[i].addEventListener("mouseover", menulist_over);
        mypageMenuList[i].addEventListener("mouseout", menulist_out);
    }
}
/*header js 부분*/
function menulist_over(){
    this.children[0].style.visibility = "visible";
}

function menulist_out(){
    this.children[0].style.visibility = "hidden";
}

/*main js 부분*/
let currentBook = 0;

function bookSlidertoLeft(){
    if(currentBook === 0){
        navSlide(15, -945);
        activeAddRemove(15);
    } else {
        if(currentBook === 8){
            navSlide(7,0);
        }
        activeAddRemove(currentBook-1);
    }
}

function bookSlidertoRight(){
    if(currentBook === 15){
        navSlide(0,0);
        activeAddRemove(0);
    } else {
        if(currentBook === 7){
            navSlide(8,-945);
        }
        activeAddRemove(currentBook+1);
    }
}
function activeAddRemove(next){
    const list = document.querySelector("#recommend_mbti_list");
    for(var i=0; i<16; i++){
        if( i == next){
            list.children[i].classList.add("active");
        } else {
            list.children[i].classList.remove("active"); 
        }
    }
    currentBook = next;
    showBook(currentBook);
}

function navSliders(){
    const list = document.querySelector("#recommend_mbti_list");
    if(list.style.marginLeft==="0px"){
        navSlide(8,-945);
        showBook(8);
    } else {
        navSlide(0,0);
        showBook(0);
    }
}

function navSlide(add,margin){
    const list = document.querySelector("#recommend_mbti_list");
    for(var i=0; i<16; i++){
        if(i == add){
            list.children[i].classList.add("active");
        } else {
            list.children[i].classList.remove("active"); 
        }
    }
    list.style.marginLeft=margin+"px";
}

function showBook(index){
    const mbti_list = document.querySelector("#mbti_recommend_list");
    mbti_list.style.marginTop=(-450*index)+"px";
    currentBook = index;
}

function buttonMove(){
    for(var i=0; i<this.classList.length; i++){
        if(isNaN(this.classList[i])===false){
            activeAddRemove(Number(this.classList[i]));
        }
    }
}
