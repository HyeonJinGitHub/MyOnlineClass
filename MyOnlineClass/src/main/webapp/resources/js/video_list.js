'use strict';

var getVideoData = function () {
	return new Promise(function (resolve, reject) {
		var videoData = [
			{"idx": 1, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn2-www.dogtime.com/assets/uploads/2018/11/dogs-fall-season-pictures-1.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 2, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 3, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://www.rspcansw.org.au/wp-content/uploads/2017/08/50_a-feature_dogs-and-puppies_mobile.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 4, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 5, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn2-www.dogtime.com/assets/uploads/2018/11/dogs-fall-season-pictures-1.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 6, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 7, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://www.rspcansw.org.au/wp-content/uploads/2017/08/50_a-feature_dogs-and-puppies_mobile.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 8, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 9, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn2-www.dogtime.com/assets/uploads/2018/11/dogs-fall-season-pictures-1.jpg", "isCheck": false, "tit": "Introduction"},
			{"idx": 10, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 11, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://www.rspcansw.org.au/wp-content/uploads/2017/08/50_a-feature_dogs-and-puppies_mobile.jpg", "isCheck": false, "tit": "Introduction", "time": 0},
			{"idx": 12, "src": "https://vjs.zencdn.net/v/oceans.mp4", "poster": "https://cdn-prod.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg", "isCheck": false, "tit": "Introduction", "time": 0},

		]
		resolve(videoData);
	})
}

getVideoData()
	.then(function (res) {
		var videoArr = res,
			vid = document.querySelector('#my-video'),
			currentNum = 0,
			maxNum = res.length,
			videoListData = {
				text: videoArr,
			};

		var player = videojs(vid, {
			inactivityTimeout: 0
		});

		//현재 받은 비디오데이터의 맨처음 list 재생준비
		player.poster(videoArr[0].poster);
		player.src(videoArr[0].src);
		$(".video__tit").text(videoArr[0].idx + ". " + videoArr[0].tit);


		var videoList = new HandleBars(videoListData, '#video__total-template', '.video__menu');
		videoList.render();

		var listItem = $('.video__items');
		listItem.eq(0).addClass('active');
		listClick(listItem);

		var setSlcect = function (listSelect, currentNum) {
			listSelect.text[currentNum].idx = videoArr[currentNum].idx;
			listSelect.text[currentNum].tit = videoArr[currentNum].tit;
			listSelect.text[currentNum].src = videoArr[currentNum].src;
			listSelect.text[currentNum].poster = videoArr[currentNum].poster;
			listSelect.text[currentNum].isCheck = videoArr[currentNum].isCheck;
		};

		player.on('play', function () {
			//동영상 플레이 감지
			removeBtn();
			//console.log(videoListData.text[currentNum].time)

			this.currentTime(videoListData.text[currentNum].time);

		});

		player.on('ended', function () {
			//비디오가 완료되었다면 체크
			videoListData.text[currentNum].isCheck = true;

			var videoList = new HandleBars(videoListData, '#video__total-template', '.video__menu');
			videoList.render();

			var listItem = $('.video__items');
			listClick(listItem);

			$('.video__items').eq(currentNum).addClass('active');

			var videoBox = document.querySelector('.vidoe__btn-box');

			if (currentNum === 0) {
				videoBox.appendChild(getBtn('nextBtn'));
			} else if (currentNum > 0 && currentNum < maxNum - 1) {
				videoBox.appendChild(getBtn('prevBtn'));
				videoBox.appendChild(getBtn('nextBtn'));
			} else if (currentNum === maxNum - 1) {
				videoBox.appendChild(getBtn('prevBtn'));
			}

			prevBtn();
			nextBtn();

			(function () {
				//3초뒤에 현재 비디오를 다시 처음부터 재생
				var timer = setTimeout(function () {
					videoListData.text[currentNum].time = 0;
					player.play();
				}, 3000);
			})();

		});

		player.on('pause', function () {
			//현재 비디오 정지 체크
			var isPaused = player.paused();

			if (isPaused) {
				//정지 되었다면 현재 멈춘만큼의 시간을 체크해서 저장.
				videoListData.text[currentNum].time = Number(player.cache_.currentTime);
			}

			return false;
		})



		function listClick(listItem) {
			listItem.on('click', function (e) {
				try {
					//클릭시 재생되고있던 비디오 시간 저장
					var timeCheck = player.currentTime();
					videoListData.text[currentNum].time = timeCheck;

					var listSelect = {
						text: videoArr,
					};

					removeBtn();

					currentNum = $(this).index();

					$('.video__items').removeClass('active');
					$(this).addClass('active');

					setSlcect(listSelect, currentNum);

					player.poster(listSelect.text[currentNum].poster);
					player.src(listSelect.text[currentNum].src);
					$(".video__tit").text(listSelect.text[currentNum].idx + ". " + listSelect.text[currentNum].tit);

					return false;
				} catch (error) {
					console.warn(error);
				}
			});
		}

		function prevBtn() {
			var prevBtn = document.querySelector('.video__prev-btn');
			if (!prevBtn) return;

			var listSelect = {
				text: videoArr,
			}

			prevBtn.addEventListener('click', function (e) {
				removeBtn();
				$('.video__items').removeClass('active');
				$('.video__items').eq(currentNum - 1).addClass('active');
				currentNum -= 1;
				setSlcect(listSelect, currentNum);
				player.poster(listSelect.text[currentNum].poster);
				player.src(listSelect.text[currentNum].src);
				$(".video__tit").text(listSelect.text[currentNum].idx + ". " + listSelect.text[currentNum].tit);
			});
		}

		function nextBtn() {
			var nextBtn = document.querySelector('.video__next-btn');
			if (!nextBtn) return;

			var listSelect = {
				text: videoArr,
			}

			nextBtn.addEventListener('click', function (e) {
				removeBtn();
				$('.video__items').removeClass('active');
				$('.video__items').eq(currentNum + 1).addClass('active');
				currentNum += 1;
				setSlcect(listSelect, currentNum);
				player.poster(listSelect.text[currentNum].poster);
				player.src(listSelect.text[currentNum].src);
				$(".video__tit").text(listSelect.text[currentNum].idx + ". " + listSelect.text[currentNum].tit);
			});
		}
	});

function getBtn(btnName) {
	var videoBtns = document.createElement('button');

	videoBtns.textContent = btnName === 'prevBtn' ? '이전' : '다음';
	videoBtns.classList.add(btnName === 'prevBtn' ? 'video__prev-btn' : 'video__next-btn');

	return videoBtns;
}

function removeBtn() {
	var btnBox = document.querySelector('.vidoe__btn-box');
	var btnBoxLength = btnBox.childNodes.length;
	if (btnBoxLength) {
		Array.from(btnBox.childNodes).map(function (item) {
			btnBox.removeChild(item);
		});
	}
}


$('.video__nav-close').on('click', function () {
	$('.video__nav')
		.css({
			"position": "absolute",
		})
		.stop()
		.animate({
			"right": "-380px"
		}, 500, function () {
			$('.video__more-btn').removeClass('off');
		});
	$('.video__contents')
		.stop()
		.animate({
			"width": "100%"
		}, 500);
});

$('.video__more-btn').on('click', function () {
	$('.video__nav')
		.css({
			"position": "absolute",
		})
		.stop()
		.animate({
			"right": "0"
		}, 500, function () {
			$('.video__more-btn').addClass('off');
		});
	$('.video__contents')
		.stop()
		.animate({
			"width": "80%"
		}, 500);
})