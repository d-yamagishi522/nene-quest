<template>
  <canvas
    width="1000"
    height="1000"
    class="canvas"
  >
    test
  </canvas>
</template>

<script>
export default {
  props: {
    side: {
      type: Number,
      default: 50,
    },
    vertical: {
      type: Number,
      default: 50,
    },
  },
  data() {
    return {
      ctx: null,
      icon: null
    }
  },
  watch: {
    side() {
      this.draw(this.side, this.vertical)
    },
    vertical() {
      this.draw(this.side, this.vertical)
    },
  },
  mounted() {
    // mounted 以降で canvas の DOM にアクセスできる
    // CreateJS などを使うときにも、ここで canvas と紐付ける
    // console.log(this.$el)
    this.ctx = this.$el.getContext('2d')
    this.draw(this.side, this.vertical)
  },
  methods: {
    draw(side, vertical) {
      const img = new Image()
      img.src = require('@/assets/icons/images.jpg')
      img.onload = () => {
        this.ctx.beginPath()
        this.ctx.clearRect(0, 0, 1000, 1000)
        this.ctx.fill()
        // 画像, 横移動, 縦移動
        this.ctx.drawImage(img, side, vertical)
      }
    },
  },
}
</script>

<style scoped>
.canvas {
  border: 1px solid #000;
}
</style>
