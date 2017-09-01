"""
使用方式：
    all_count = models.UserInfo.objects.all().count()

    page_info = PageInfo(request.GET.get('p'),10,all_count,request.path_info)

    user_list = models.UserInfo.objects.all()[page_info.start():page_info.end()]


"""


class PageInfo(object):
    def __init__(self, current_page, per_page_num, all_count, base_url, filter_condtions, q_val, last_orderby_key,
                 page_range=11, ):
        '''

        :param current_page:  当前页
        :param per_page_num:  每页显示数据条数
        :param all_count:  数据库总个数
        :param base_url:  页码标签的前缀
        :param filter_condtions: 过滤字典
        :param q_val:   搜索的值
        :param page_range:  页面最多显示的页码个数
        '''
        try:
            current_page = int(current_page)
        except Exception as e:
            current_page = int(1)
        self.current_page = current_page
        self.per_page_num = per_page_num
        self.all_count = all_count
        a, b = divmod(all_count, per_page_num)
        if b != 0:
            self.all_page = a + 1
        else:
            self.all_page = a
        self.base_url = base_url
        self.page_range = page_range
        self.filter_str = '_q=%s&' % q_val + '&'.join([k + '=' + v for k, v in filter_condtions.items()])
        self.last_orderby_key = '&_o=%s' % last_orderby_key
        print(self.filter_str)

    def start(self):
        return (self.current_page - 1) * self.per_page_num

    def end(self):
        return self.current_page * self.per_page_num

    def page_str(self):
        """
        在HTML页面中显示页码信息
        :return:
        """
        page_list = []
        url = self.filter_str + self.last_orderby_key
        if self.current_page <= 1:
            prev = '<li><a href="%s?%s">上一页</a></li>' % (self.base_url, url)
        else:
            prev = '<li><a href="%s?p=%s&%s">上一页</a></li>' % (self.base_url, self.current_page - 1, url)
        page_list.append(prev)

        # 只有 8页
        if self.all_page <= self.page_range:
            start = 1
            end = self.all_page + 1
        else:
            # 页数 18
            if self.current_page > int(self.page_range / 2):
                # 当前页： 6,7,8,,9,100
                if (self.current_page + int(self.page_range / 2)) > self.all_page:
                    start = self.all_page - self.page_range + 1
                    end = self.all_page + 1
                else:
                    start = self.current_page - int(self.page_range / 2)
                    end = self.current_page + int(self.page_range / 2) + 1
            else:
                # 当前页： 1,2,3,4,5,
                start = 1
                end = self.page_range + 1
        for i in range(start, end):
            if self.current_page == i:
                temp = '<li class="active"><a href="%s?p=%s&%s">%s</a></li>' % (self.base_url, i, url, i,)
            else:
                temp = '<li><a href="%s?p=%s&%s">%s</a></li>' % (self.base_url, i, url, i,)
            page_list.append(temp)

        if self.current_page >= self.all_page:
            nex = '<li><a href="%s?%s">下一页</a></li>' % (self.base_url, url)
        else:
            nex = '<li><a href="%s?p=%s&%s">下一页</a></li>' % (self.base_url, self.current_page + 1, url)
        page_list.append(nex)
        print(page_list)

        return "".join(page_list)
