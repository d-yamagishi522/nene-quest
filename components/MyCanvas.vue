<template>
  <canvas
    width="1000"
    height="600"
    class="canvas"
  />
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
    }
  },
  data() {
    return {
      ctx: null
    }
  },
  watch: {
    side() {
      this.draw(this.side, this.vertical)
      this.ctx.clearRect(0, 0, 1000, 1000)
    },
    vertical() {
      this.draw(this.side, this.vertical)
    }
  },
  mounted() {
    this.ctx = this.$el.getContext('2d')
    this.draw(this.side, this.vertical)
  },
  methods: {
    draw(side, vertical) {
      const img = new Image()
      // 5移動するたびに画像を入れ替える
      if (((side + vertical) / 5) % 10 < 5) {
        img.src = require('@/assets/icons/mine1.png')
      } else {
        img.src = require('@/assets/icons/mine2.png')
      }
      img.onload = () => {
        this.ctx.clearRect(0, 0, 1000, 1000)
        // 画像, 横移動, 縦移動
        this.ctx.drawImage(img, side, vertical)
      }
    }
  }
}
</script>

<style scoped>
.canvas {
  width: 100%;
  height: 100vh;
  background-color: gray;
}
</style>
