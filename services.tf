resource "aws_elb" "cactus-app" {
    name = "cactus-app-elb"
    security_groups = ["${aws_security_group.load_balancers.id}"]
    subnets = ["${aws_subnet.main.id}"]

    listener {
        lb_protocol = "http"
        lb_port = 80
    }

    health_check {
        healthy_threshold = 3
        unhealthy_threshold = 2
        timeout = 3
        path = "/"
        interval = 5
    }

    cross_zone_load_balancing = true
}

resource "aws_ecs_task_definition" "cactus-app" {
    family = "cactus-app"
    container_definitions = "${file("task-definitions/cactus-app-td.json")}"
}

resource "aws_ecs_service" "cactus-app" {
    name = "cactus-app"
    cluster = "${aws_ecs_cluster.main.id}"
    task_definition = "${aws_ecs_task_definition.cactus-app.arn}"
    iam_role = "${aws_iam_role.ecs_service_role.arn}"
    desired_count = 2
    depends_on = ["aws_iam_role_policy.ecs_service_role_policy"]

    load_balancer {
        elb_name = "${aws_elb.cactus-app.id}"
        container_name = "cactus-app"
        container_port = 80
    }
}
