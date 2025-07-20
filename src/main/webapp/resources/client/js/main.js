(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })

        const urlParams = new URLSearchParams(window.location.search);

        // Check các checkbox theo 'factory'
        const factories = urlParams.get('factory');
        if (factories) {
            factories.split(',').forEach(val => {
                $(`#CheckBrand input[value="${val}"]`).prop('checked', true);
            });
        }

        // Check các checkbox theo 'target'
        const targets = urlParams.get('target');
        if (targets) {
            targets.split(',').forEach(val => {
                $(`#CheckType input[value="${val}"]`).prop('checked', true);
            });
        }

        // Check các checkbox theo 'price'
        const prices = urlParams.get('price');
        if (prices) {
            prices.split(',').forEach(val => {
                $(`#CheckNumber input[value="${val}"]`).prop('checked', true);
            });
        }

        // Check radio button theo 'sort'
        const sortValue = urlParams.get('sort');
        if (sortValue) {
            $(`#CheckSort input[name="radio-sort"][value="${sortValue}"]`).prop('checked', true);
        }
    });


    // Product Quantity
    $('.quantity button').on('click', function () {
        var change = 0;

        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        button.parent().parent().find('input').val(newVal);

        const input = button.parent().parent().find('input');
        input.val(newVal);

        //set form index
        const index = input.attr('cartdeatil-status-id');
        const el = document.getElementById(`cartDetails${index}.quantity`)
        $(el).val(newVal);

        // get price
        const price = input.attr('cartdetail-price');
        const id = input.attr('cartdetail-id');

        const priceElement = $(`p[cartdetail-id='${id}']`);
        if (priceElement) {
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
        }

        // update total price
        const totalPriceElement = $(`p[cartdetail-totalPrice]`);

        if (totalPriceElement && totalPriceElement.length) {
            const totalPrice = totalPriceElement.first().attr("cartdetail-totalPrice");
            let newTotal = +totalPrice;
            if (change === 0) {
                newTotal = +totalPrice;
            } else {
                newTotal = +price * change + +totalPrice;
            }
            change = 0;

            $('#totalPriceTemp').val(newTotal);

            //update
            totalPriceElement?.each(function (index,elemnt) {
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");
                $(totalPriceElement[index]).attr("cartdetail-totalPrice", newTotal);
            })
        }
    });

    function formatCurrency(value) {
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0
        });
        let formatted = formatter.format(value);
        formatted = formatted.replace(/\./g, ',');
        return formatted
    }

    $("#Check_btn").click(function(e){
        e.preventDefault();
        var brand = [];
        var type = [];
        var number = [];
        
        $('#CheckBrand .form-check-input:checked').each(function() {
            brand.push($(this).val());
        })

        $('#CheckType .form-check-input:checked').each(function() {
            type.push($(this).val());
        })

        $('#CheckNumber .form-check-input:checked').each(function() {
            number.push($(this).val());
        })

        let sortValue = $("input[name=radio-sort]:checked").val();

        const currentUrl = new URL(window.location.href);
        const searchParam = currentUrl.searchParams;

        searchParam.set('page', '0');
        searchParam.set('sort', sortValue);

        searchParam.delete('factory');
        searchParam.delete('target');
        searchParam.delete('price');


        if (brand.length > 0) {
            searchParam.set('factory', brand.join(','));
        }

        if (type.length > 0) {
            searchParam.set('target', type.join(','));
        }
      
        if (number.length > 0) {
            searchParam.set('price', number.join(','));
        }

        window.location.href = currentUrl;
    })

})(jQuery);

