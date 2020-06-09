package com.leospring.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

/**
 * Copyright (C), 2020, 北京云杉世界信息技术有限公司
 * FileName: AppController
 * Author:   liushiquan（liushiquan@meicai.cn）
 * Date:     2020/6/9 21:16
 * Description:
 */
@RestController
@RequestMapping
public class AppController {

    @RequestMapping("getName")
    public Mono getName(){
        return Mono.just("hello world");
    }
}
